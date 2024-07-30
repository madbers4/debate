import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

class DebatesStagePauseOverlay extends StatefulWidget {
  const DebatesStagePauseOverlay({super.key});

  @override
  State<DebatesStagePauseOverlay> createState() => _State();
}

class _State extends State<DebatesStagePauseOverlay> {
  bool doNotReduceAttempts = false;

  @override
  Widget build(BuildContext context) {
    const double titleStartPos = 270;

    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final roomsState = context.watch<RoomsState>();

    return Center(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: titleStartPos,
            child: TransparentPointer(
              transparent: stageState.inPauseOvrl != true,
              child: Center(
                child: Column(
                  children: [
                    const GameTitle(
                      child: 'Пауза',
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    roomsState.selectedRole is Plaintiff &&
                            stageState.inPauseOvrl == true
                        ? DebatesButton(
                            isEnabled: true,
                            text: 'Продолжить',
                            onPressed: () {
                              if (stageState.inPauseOvrl != true) {
                                return;
                              }

                              gameState.updateGameState(
                                  GameStageStates.fromExisting(
                                      game.stageStates,
                                      DebatesStageState.fromJson({
                                        ...stageState.toJson(),
                                        'inPauseOvrl': false,
                                        'inPause': false
                                      })));
                            },
                          )
                        : Container()
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
