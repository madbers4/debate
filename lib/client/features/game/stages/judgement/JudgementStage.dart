import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/judgement/JudgementStageBody.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';

class JudgementStage extends StatelessWidget {
  const JudgementStage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game;
    final stageState = game.stageStates.title;
    final scenario = game.scenario;
    final description = scenario.description;

    return ScreenLayout(
      bodyContent: const JudgementStageBody(),
      leftTopContent: const ExitButton(),
      rightBottomContent: TextButton(
        child: Text('Признать виновным'),
        onPressed: () => {},
      ),
      leftBottomContent: TextButton(
        child: Text('Признать невиновным'),
        onPressed: () {},
      ),
    );
  }
}
