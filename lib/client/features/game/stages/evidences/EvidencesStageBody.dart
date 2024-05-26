import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/EvidencesState.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';

class EvidencesStageBody extends StatelessWidget {
  final List<ScenarioEvedence> evidences;

  const EvidencesStageBody({super.key, required this.evidences});

  @override
  Widget build(BuildContext context) {
    const double titleEndPos = 100.0;
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.evidences;

    return Center(
      child: Stack(
        children: <Widget>[
          // Анимированное позиционирование для заголовка
          const AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: titleEndPos,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  GameTitle(
                    child: 'Улики',
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // GameDescription(
                  //   child: description,
                  // )
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: 50,
          // ),
          // Карты
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: titleEndPos + 60,
            left: 0,
            right: 0,
            child: Visibility(
              // Visibility виджет управляет видимостью описания
              visible: true,
              child: Center(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: evidences.indexed
                          .map((e) {
                            final index = e.$1;
                            final value = e.$2;
                            final List<Widget> res = [];

                            if (index != 0) {
                              res.add(const SizedBox(
                                width: 10,
                              ));
                            }

                            bool cardShowed = stageState.showedEvidencesIds
                                .any((element) => element == value.id);

                            res.add(EvidenceCard(
                              evedence: value,
                              isCardCardFlipped: !cardShowed,
                              onFlip: () {
                                var newShowedEvidencesIds =
                                    stageState.showedEvidencesIds;

                                if (cardShowed) {
                                  newShowedEvidencesIds = newShowedEvidencesIds
                                      .where((element) => element != value.id)
                                      .toList();
                                } else {
                                  newShowedEvidencesIds = [
                                    ...stageState.showedEvidencesIds,
                                    value.id
                                  ];
                                }

                                gameState.updateGameState(
                                    GameStageStates.fromExisting(
                                        gameState.game!.stageStates,
                                        EvidencesStageState(
                                            id: stageState.id,
                                            isCardsShowed:
                                                stageState.isCardsShowed,
                                            showedEvidencesIds:
                                                newShowedEvidencesIds)));
                              },
                            ));
                            return res;
                          })
                          .expand((e) => e)
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
