import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

class DebatesStageDenialNotConfirmedOverlay extends StatefulWidget {
  const DebatesStageDenialNotConfirmedOverlay({super.key});

  @override
  State<DebatesStageDenialNotConfirmedOverlay> createState() => _State();
}

class _State extends State<DebatesStageDenialNotConfirmedOverlay> {
  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;

    final attempts = Game.maxAttempts - stageState.incorrectAttempts;

    return Stack(
      children: [
        Positioned(
          top: 300,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                const GameTitle(
                  child: 'Улика не опровергает это событие',
                  fontSize: 40,
                ),
                Container(
                  height: 25,
                ),
                GameDescription(child: 'Оставшиеся попытки: ${attempts}')
              ],
            ),
          ),
        ),
        ...(roomsState.selectedRole is Plaintiff
            ? [
                Positioned(
                    top: 530,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: attempts > 0
                          ? [
                              DebatesButton(
                                isEnabled: true,
                                onPressed: () {
                                  gameState.updateGameState(
                                      GameStageStates.fromExisting(
                                          game.stageStates,
                                          DebatesStageState.fromJson({
                                            ...stageState.toJson(),
                                            'inDenialNotConfirmed': false,
                                          })));
                                },
                                text: 'Продолжить',
                              )
                            ]
                          : [
                              DebatesButton(
                                isEnabled: true,
                                onPressed: () {
                                  gameState.updateStage(GameStage.Judgement);
                                },
                                red: true,
                                fontSize: 16,
                                text: 'Перейти к приговору',
                              ),
                              Container(
                                height: 40,
                              ),
                              DebatesButton(
                                isEnabled: true,
                                onPressed: () {
                                  gameState.updateGameState(
                                      GameStageStates.fromExisting(
                                          game.stageStates,
                                          DebatesStageState.fromJson({
                                            ...stageState.toJson(),
                                            'incorrectAttempts':
                                                stageState.incorrectAttempts -
                                                    1,
                                          })));
                                },
                                fontSize: 11,
                                text: 'Еще одна попытка...',
                              ),
                            ],
                    ))
              ]
            : [])
      ],
    );
  }
}
