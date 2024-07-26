import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';

class VerdictStageBody extends StatelessWidget {
  const VerdictStageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();

    final game = gameState.game!;
    final stageState = game.stageStates.judgement;
    final scenario = game.scenario;
    final description = scenario.description;

    return Center(
      child: GameTitle(
        child: stageState.foundGuilty ? 'Виновным' : 'Невиновным',
      ),
    );
  }
}
