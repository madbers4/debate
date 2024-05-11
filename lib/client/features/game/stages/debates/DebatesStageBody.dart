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
              actId: 'I',
              event: scenario.events[0],
            )),
        Positioned(
            top: 0,
            right: 0,
            child: ActTile(
              actId: 'I',
              event: scenario.events[1],
            )),
        Positioned(
            bottom: 0,
            left: 0,
            child: ActTile(
              actId: 'I',
              event: scenario.events[2],
            )),
        Positioned(
            bottom: 0,
            right: 0,
            child: ActTile(
              actId: 'I',
              event: scenario.events[3],
            )),
      ],
    );
  }
}
