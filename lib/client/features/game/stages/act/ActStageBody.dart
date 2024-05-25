import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/GameState.dart';

import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/ActStageState.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/scenario/ScenarioEvent.dart';

class ActStageBody extends StatelessWidget {
  final String actKey;
  final String actTitle;
  final ActStageState stageState;
  final ScenarioEvent event;
  // final String title;
  // final String description;
  // final bool isCardsShowed;
  // final ScenarioFact firstCard;
  // final ScenarioFact secondCard;
  // final ScenarioFact thirdCard;
  // final bool isFirstCardShowed;
  // final bool isSecondCardShowed;
  // final bool isThirdCardShowed;

  const ActStageBody(
      {super.key,
      required this.actKey,
      required this.actTitle,
      required this.stageState,
      required this.event
      // required this.title,
      // required this.description,
      // required this.isCardsShowed,
      // required this.firstCard,
      // required this.secondCard,
      // required this.thirdCard,
      // required this.isFirstCardShowed,
      // required this.isSecondCardShowed,
      // required this.isThirdCardShowed,
      });

  @override
  Widget build(BuildContext context) {
    final roomsState = context.watch<RoomsState>();
    final gameState = context.watch<GameState>();

    const double titleStartPos = 200.0;
    const double titleEndPos = 100.0;

    return Center(
      child: Stack(
        children: <Widget>[
          // Анимированное позиционирование для заголовка
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: stageState.isCardsShowed ? titleEndPos : titleStartPos,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  GameTitle(
                    child: actTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GameTitle(
                    child: event.title,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GameDescription(
                    child: event.description,
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
            top: stageState.isCardsShowed
                ? titleEndPos + 60
                : titleStartPos +
                    500, // смещаем описание ниже, если _showDescription true
            left: 0,
            right: 0,
            child: Visibility(
              // Visibility виджет управляет видимостью описания
              visible: stageState.isCardsShowed,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            FactCard(
                              fact: event.facts[0],
                              isCardCardFlipped:
                                  roomsState.selectedRole is Plaintiff
                                      ? false
                                      : !stageState.isFirstCardShowed,
                              isDisabled: !stageState.isFirstCardShowed,
                            ),
                            SizedBox(
                              width:
                                  roomsState.selectedRole is Plaintiff ? 10 : 0,
                            ),
                            roomsState.selectedRole is Plaintiff
                                ? TextButton(
                                    onPressed: !stageState.isFirstCardShowed
                                        ? () {
                                            gameState.updateGameState(
                                                GameStageStates.fromExisting(
                                                    gameState.game!.stageStates,
                                                    ActStageState(
                                                        id: stageState.id,
                                                        isCardsShowed:
                                                            stageState
                                                                .isCardsShowed,
                                                        isFirstCardShowed: true,
                                                        isSecondCardShowed:
                                                            stageState
                                                                .isSecondCardShowed,
                                                        isThirdCardShowed:
                                                            stageState
                                                                .isThirdCardShowed),
                                                    actKey));
                                          }
                                        : null,
                                    child: const Text('Показать обвиняемому'))
                                : Container()
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            FactCard(
                              fact: event.facts[1],
                              isCardCardFlipped:
                                  roomsState.selectedRole is Plaintiff
                                      ? false
                                      : !stageState.isSecondCardShowed,
                              isDisabled: !stageState.isSecondCardShowed,
                            ),
                            SizedBox(
                              width:
                                  roomsState.selectedRole is Plaintiff ? 10 : 0,
                            ),
                            roomsState.selectedRole is Plaintiff
                                ? TextButton(
                                    onPressed: !stageState.isSecondCardShowed
                                        ? () {
                                            gameState.updateGameState(
                                                GameStageStates.fromExisting(
                                                    gameState.game!.stageStates,
                                                    ActStageState(
                                                        id: stageState.id,
                                                        isCardsShowed:
                                                            stageState
                                                                .isCardsShowed,
                                                        isFirstCardShowed:
                                                            stageState
                                                                .isFirstCardShowed,
                                                        isSecondCardShowed:
                                                            true,
                                                        isThirdCardShowed:
                                                            stageState
                                                                .isThirdCardShowed),
                                                    actKey));
                                          }
                                        : null,
                                    child: const Text('Показать обвиняемому'))
                                : Container()
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            FactCard(
                              fact: event.facts[2],
                              isCardCardFlipped:
                                  roomsState.selectedRole is Plaintiff
                                      ? false
                                      : !stageState.isThirdCardShowed,
                              isDisabled: !stageState.isThirdCardShowed,
                            ),
                            SizedBox(
                              width:
                                  roomsState.selectedRole is Plaintiff ? 10 : 0,
                            ),
                            roomsState.selectedRole is Plaintiff
                                ? TextButton(
                                    onPressed: !stageState.isThirdCardShowed
                                        ? () {
                                            gameState.updateGameState(
                                                GameStageStates.fromExisting(
                                                    gameState.game!.stageStates,
                                                    ActStageState(
                                                        id: stageState.id,
                                                        isCardsShowed:
                                                            stageState
                                                                .isCardsShowed,
                                                        isFirstCardShowed:
                                                            stageState
                                                                .isFirstCardShowed,
                                                        isSecondCardShowed:
                                                            stageState
                                                                .isSecondCardShowed,
                                                        isThirdCardShowed:
                                                            true),
                                                    actKey));
                                          }
                                        : null,
                                    child: const Text('Показать обвиняемому'))
                                : Container()
                          ],
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
