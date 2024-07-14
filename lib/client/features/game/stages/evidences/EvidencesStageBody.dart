import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/EvidencesState.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';

class EvidencesStageBody extends StatelessWidget {
  final List<ScenarioEvedence> evidences;

  const EvidencesStageBody({super.key, required this.evidences});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final stageState = game.stageStates.evidences;

    const double titleEndPos = 100.0;
    const double cardsEndPos = 200.0;
    const bool isCardsShowed = true;

    return Center(
      child: Stack(
        children: <Widget>[
          // Анимированное позиционирование для заголовка
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: titleEndPos,
            left: 0,
            right: 0,
            child: const Center(
                child: GameTitle(
              child: 'Улики',
            )),
          ),
          // AnimatedPositioned(
          //   duration: Duration(milliseconds: 500),
          //   curve: Curves.easeInOut,
          //   top: isCardsShowed ? textPos : textPos,
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //       child: AnimatedOpacity(
          //     opacity: isCardsShowed ? 0.0 : 1.0,
          //     duration: Duration(milliseconds: 1000),
          //     child: GameDescription(
          //       child: description,
          //     ),
          //   )),
          // ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            top: cardsEndPos,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 1000),
              opacity: isCardsShowed ? 1.0 : 0.0,
              child: Visibility(
                // Visibility виджет управляет видимостью описания
                visible: true,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 800,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: evidences.indexed
                              .map((e) {
                                final value = e.$2;
                                final List<Widget> res = [];

                                bool cardShowed = stageState.showedEvidencesIds
                                    .any((element) => element == value.id);

                                res.add(EvidenceCard(
                                  evedence: value,
                                  isCardCardFlipped: !cardShowed,
                                  isDisabled:
                                      roomsState.selectedRole is! Plaintiff &&
                                          roomsState.selectedRole is! Defendant,
                                  onFlip: () {
                                    var newShowedEvidencesIds =
                                        stageState.showedEvidencesIds;

                                    if (cardShowed) {
                                      newShowedEvidencesIds =
                                          newShowedEvidencesIds
                                              .where((element) =>
                                                  element != value.id)
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
                          // children: [
                          //   OriginCard(
                          //     origin: bornOrigin,
                          //     isCardCardFlipped: !stageState.isFirstCardShowed,
                          //     isDisabled:
                          //         roomsState.selectedRole is! Plaintiff &&
                          //             roomsState.selectedRole is! Defendant,
                          //     onFlip: () {
                          //       gameState.updateGameState(
                          //           GameStageStates.fromExisting(
                          //               game.stageStates,
                          //               DefendantStageState(
                          //                   id: stageState.id,
                          //                   isCardsShowed:
                          //                       stageState.isCardsShowed,
                          //                   isFirstCardShowed:
                          //                       !stageState.isFirstCardShowed,
                          //                   isSecondCardShowed:
                          //                       stageState.isSecondCardShowed,
                          //                   isThirdCardShowed:
                          //                       stageState.isThirdCardShowed)));
                          //     },
                          //   ),
                          // ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
