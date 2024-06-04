import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/cards/OriginCard.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DefendantStageState.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';

class DefendantStageBody extends StatelessWidget {
  final String description;
  final bool isCardsShowed;
  final ScenarioDefendantOrigin bornOrigin;
  final ScenarioDefendantOrigin secretOrigin;
  final ScenarioDefendantOrigin professionOrigin;

  const DefendantStageBody(
      {super.key,
      required this.description,
      required this.isCardsShowed,
      required this.bornOrigin,
      required this.secretOrigin,
      required this.professionOrigin});

  @override
  Widget build(BuildContext context) {
    const double titleStartPos = 100.0;
    const double titleEndPos = 100.0;

    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final stageState = game.stageStates.defendant;

    return Center(
      child: Stack(
        children: <Widget>[
          // Анимированное позиционирование для заголовка
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: isCardsShowed ? titleEndPos : titleStartPos,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  const GameTitle(
                    child: 'Обвиняемый',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GameDescription(
                    child: description,
                  )
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
            top: isCardsShowed
                ? titleEndPos + 60
                : titleStartPos +
                    500, // смещаем описание ниже, если _showDescription true
            left: 0,
            right: 0,
            child: Visibility(
              // Visibility виджет управляет видимостью описания
              visible: isCardsShowed,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OriginCard(
                          origin: bornOrigin,
                          isCardCardFlipped: !stageState.isFirstCardShowed,
                          isDisabled: roomsState.selectedRole is! Plaintiff &&
                              roomsState.selectedRole is! Defendant,
                          onFlip: () {
                            gameState.updateGameState(
                                GameStageStates.fromExisting(
                                    game.stageStates,
                                    DefendantStageState(
                                        id: stageState.id,
                                        isCardsShowed: stageState.isCardsShowed,
                                        isFirstCardShowed:
                                            !stageState.isFirstCardShowed,
                                        isSecondCardShowed:
                                            stageState.isSecondCardShowed,
                                        isThirdCardShowed:
                                            stageState.isThirdCardShowed)));
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        OriginCard(
                          isCardCardFlipped: !stageState.isSecondCardShowed,
                          origin: professionOrigin,
                          isDisabled: roomsState.selectedRole is! Plaintiff &&
                              roomsState.selectedRole is! Defendant,
                          onFlip: () {
                            gameState.updateGameState(
                                GameStageStates.fromExisting(
                                    game.stageStates,
                                    DefendantStageState(
                                        id: stageState.id,
                                        isCardsShowed: stageState.isCardsShowed,
                                        isFirstCardShowed:
                                            stageState.isFirstCardShowed,
                                        isSecondCardShowed:
                                            !stageState.isSecondCardShowed,
                                        isThirdCardShowed:
                                            stageState.isThirdCardShowed)));
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        OriginCard(
                          origin: secretOrigin,
                          isDisabled: roomsState.selectedRole is! Defendant,
                          isCardCardFlipped:
                              roomsState.selectedRole is Defendant
                                  ? !stageState.isThirdCardShowed
                                  : true,
                          onFlip: () {
                            gameState.updateGameState(
                                GameStageStates.fromExisting(
                                    game.stageStates,
                                    DefendantStageState(
                                        id: stageState.id,
                                        isCardsShowed: stageState.isCardsShowed,
                                        isFirstCardShowed:
                                            stageState.isFirstCardShowed,
                                        isSecondCardShowed:
                                            stageState.isSecondCardShowed,
                                        isThirdCardShowed:
                                            !stageState.isThirdCardShowed)));
                          },
                        ),
                      ],
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
