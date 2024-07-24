import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/act/ShowButton.dart';

import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/ActStageState.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';

class ActStageBody extends StatelessWidget {
  final String actKey;
  final String actTitle;
  final ActStageState stageState;
  final ScenarioAct event;

  const ActStageBody(
      {super.key,
      required this.actKey,
      required this.actTitle,
      required this.stageState,
      required this.event});

  @override
  Widget build(BuildContext context) {
    final roomsState = context.watch<RoomsState>();
    final gameState = context.watch<GameState>();

    const double titleStartPos = 85;
    const double titleEndPos = 10;
    const double textStartPos = 250;
    const double textEndPos = 200;
    const double cardsStartPos = 500;
    const double cardsEndPos = 200;

    final isCardsShowed = stageState.isCardsShowed;

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
                  GameTitle(
                    child: actTitle,
                    fontSize: 60,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GameTitle(
                    child: event.title,
                    fontSize: 40,
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: isCardsShowed ? textEndPos : textStartPos,
            left: 0,
            right: 0,
            child: Center(
                child: AnimatedOpacity(
              opacity: isCardsShowed ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 1000),
              child: GameDescription(
                child: event.description,
              ),
            )),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            top: isCardsShowed ? cardsEndPos : cardsStartPos,
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
                            Column(
                              children: [
                                FactCard(
                                  fact: event.events[0],
                                  isCardCardFlipped:
                                      roomsState.selectedRole is Plaintiff
                                          ? false
                                          : !stageState.isFirstCardShowed,
                                  isDisabled: true,
                                ),
                                SizedBox(
                                  width: roomsState.selectedRole is Plaintiff
                                      ? 20
                                      : 0,
                                ),
                                roomsState.selectedRole is Plaintiff
                                    ? DebatesButton(
                                        text: !stageState.isFirstCardShowed
                                            ? 'Показать'
                                            : 'Показано',
                                        isEnabled:
                                            !stageState.isFirstCardShowed,
                                        onPressed: !stageState.isFirstCardShowed
                                            ? () {
                                                gameState.updateGameState(
                                                    GameStageStates.fromExisting(
                                                        gameState
                                                            .game!.stageStates,
                                                        ActStageState(
                                                            id: stageState.id,
                                                            isCardsShowed:
                                                                stageState
                                                                    .isCardsShowed,
                                                            isFirstCardShowed:
                                                                true,
                                                            isSecondCardShowed:
                                                                stageState
                                                                    .isSecondCardShowed,
                                                            isThirdCardShowed:
                                                                stageState
                                                                    .isThirdCardShowed),
                                                        actKey));
                                              }
                                            : null,
                                      )
                                    : Container()
                              ],
                            ),
                            Column(
                              children: [
                                FactCard(
                                  fact: event.events[1],
                                  isCardCardFlipped:
                                      roomsState.selectedRole is Plaintiff
                                          ? false
                                          : !stageState.isSecondCardShowed,
                                  isDisabled: true,
                                ),
                                SizedBox(
                                  width: roomsState.selectedRole is Plaintiff
                                      ? 20
                                      : 0,
                                ),
                                roomsState.selectedRole is Plaintiff
                                    ? DebatesButton(
                                        text: !stageState.isSecondCardShowed
                                            ? 'Показать'
                                            : 'Показано',
                                        isEnabled:
                                            !stageState.isSecondCardShowed,
                                        onPressed: !stageState
                                                .isSecondCardShowed
                                            ? () {
                                                gameState.updateGameState(
                                                    GameStageStates.fromExisting(
                                                        gameState
                                                            .game!.stageStates,
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
                                      )
                                    : Container()
                              ],
                            ),
                            Column(
                              children: [
                                FactCard(
                                  fact: event.events[2],
                                  isDisabled: true,
                                  isCardCardFlipped:
                                      roomsState.selectedRole is Plaintiff
                                          ? false
                                          : !stageState.isThirdCardShowed,
                                ),
                                SizedBox(
                                  width: roomsState.selectedRole is Plaintiff
                                      ? 20
                                      : 0,
                                ),
                                roomsState.selectedRole is Plaintiff
                                    ? DebatesButton(
                                        text: !stageState.isThirdCardShowed
                                            ? 'Показать'
                                            : 'Показано',
                                        isEnabled:
                                            !stageState.isThirdCardShowed,
                                        onPressed: !stageState.isThirdCardShowed
                                            ? () {
                                                gameState.updateGameState(
                                                    GameStageStates.fromExisting(
                                                        gameState
                                                            .game!.stageStates,
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
                                      )
                                    : Container()
                              ],
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
