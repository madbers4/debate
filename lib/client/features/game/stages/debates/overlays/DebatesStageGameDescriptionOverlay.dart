import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/title/TitleStageBody.dart';

class DebatesStageDefendantOverlay extends StatefulWidget {
  const DebatesStageDefendantOverlay({super.key});

  @override
  State<DebatesStageDefendantOverlay> createState() => _State();
}

class _State extends State<DebatesStageDefendantOverlay> {
  bool doNotReduceAttempts = false;

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.title;
    final scenario = game.scenario;
    final description = scenario.description;

    return TitleStageBody(
      title: description.title,
      description: description.description,
      isDescriptionShowed: stageState.isDescriptionShowed,
    );
  }
}
