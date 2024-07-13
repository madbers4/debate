import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    const double titleStartPos = 100;
    const double titleEndPos = 100;
    const double textPos = 200;
    const double cardStartPos = 200;
    const double cardEndPos = 500;

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
            child: const Center(
                child: GameTitle(
              child: 'Обвиняемый',
            )),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: isCardsShowed ? textPos : textPos,
            left: 0,
            right: 0,
            child: Center(
                child: AnimatedOpacity(
              opacity: isCardsShowed ? 0.0 : 1.0,
              duration: Duration(milliseconds: 1000),
              child: GameDescription(
                child: description,
              ),
            )),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            top: isCardsShowed ? cardStartPos : cardEndPos,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 1000),
              opacity: isCardsShowed ? 1.0 : 0.0,
              child: Visibility(
                // Visibility виджет управляет видимостью описания
                visible: isCardsShowed,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 800,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OriginCard(
                              origin: bornOrigin,
                              isCardCardFlipped: !stageState.isFirstCardShowed,
                              isDisabled:
                                  roomsState.selectedRole is! Plaintiff &&
                                      roomsState.selectedRole is! Defendant,
                              onFlip: () {
                                gameState.updateGameState(
                                    GameStageStates.fromExisting(
                                        game.stageStates,
                                        DefendantStageState(
                                            id: stageState.id,
                                            isCardsShowed:
                                                stageState.isCardsShowed,
                                            isFirstCardShowed:
                                                !stageState.isFirstCardShowed,
                                            isSecondCardShowed:
                                                stageState.isSecondCardShowed,
                                            isThirdCardShowed:
                                                stageState.isThirdCardShowed)));
                              },
                            ),
                            OriginCard(
                              isCardCardFlipped: !stageState.isSecondCardShowed,
                              origin: professionOrigin,
                              isDisabled:
                                  roomsState.selectedRole is! Plaintiff &&
                                      roomsState.selectedRole is! Defendant,
                              onFlip: () {
                                gameState.updateGameState(
                                    GameStageStates.fromExisting(
                                        game.stageStates,
                                        DefendantStageState(
                                            id: stageState.id,
                                            isCardsShowed:
                                                stageState.isCardsShowed,
                                            isFirstCardShowed:
                                                stageState.isFirstCardShowed,
                                            isSecondCardShowed:
                                                !stageState.isSecondCardShowed,
                                            isThirdCardShowed:
                                                stageState.isThirdCardShowed)));
                              },
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
                                            isCardsShowed:
                                                stageState.isCardsShowed,
                                            isFirstCardShowed:
                                                stageState.isFirstCardShowed,
                                            isSecondCardShowed:
                                                stageState.isSecondCardShowed,
                                            isThirdCardShowed: !stageState
                                                .isThirdCardShowed)));
                              },
                            ),
                          ],
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
