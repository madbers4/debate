import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/act-tile/ActTile.dart';

class DebatesStageBody extends StatelessWidget {
  const DebatesStageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game;
    final stageState = game.stageStates.defendant;
    final scenario = game.scenario;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
            top: 0,
            left: 0,
            child: ActTile(
              ac\
              \
              
              : 'I',
            )),
        Positioned(top: 0, right: 0, child: Container()),
        Positioned(bottom: 0, left: 0, child: Container()),
        Positioned(bottom: 0, right: 0, child: Container()),
      ],
    );
  }
}
