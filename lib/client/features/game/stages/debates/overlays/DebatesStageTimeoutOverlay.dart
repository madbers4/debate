import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';

import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

class DebatesStageTimeoutOverlay extends StatefulWidget {
  const DebatesStageTimeoutOverlay({super.key});

  @override
  State<DebatesStageTimeoutOverlay> createState() => _State();
}

class _State extends State<DebatesStageTimeoutOverlay> {
  @override
  Widget build(BuildContext context) {
    const double titleStartPos = 270;

    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;

    return Center(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: titleStartPos,
            child: Center(
              child: Column(
                children: [
                  const GameTitle(
                    child: 'Таймаут',
                  ),
                  const GameDescription(
                    child: 'Дебаты зашли в тупик и время объявить приговор?',
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  roomsState.selectedRole is Plaintiff
                      ? DebatesButton(
                          isEnabled: true,
                          text: 'Перейти к приговору',
                          red: true,
                          fontSize: 18,
                          onPressed: () {
                            gameState.updateStage(GameStage.Judgement);
                          },
                        )
                      : Container(),
                  const SizedBox(
                    height: 100,
                  ),
                  roomsState.selectedRole is Plaintiff &&
                          stageState.isDebatesTimeout == true
                      ? DebatesButton(
                          isEnabled: true,
                          fontSize: 12,
                          text: 'Еще одну минуту...',
                          onPressed: () {
                            gameState.gameTime = const Duration(minutes: 1);
                            gameState
                                .updateGameState(GameStageStates.fromExisting(
                                    game.stageStates,
                                    DebatesStageState.fromJson({
                                      ...stageState.toJson(),
                                      'isDebatesTimeout': false,
                                    })));
                          },
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
