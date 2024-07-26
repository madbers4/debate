import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/features/dialog/DialogLayout.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/common/features/game/GameStage.dart';

class DabatesStageConfirmJudgementDialog extends StatelessWidget {
  const DabatesStageConfirmJudgementDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;

    return DialogLayout(
      bodyContent: const TransparentPointer(
          child: GameDescription(child: 'Перейти к приговору?')),
      rightBottomContent: DebatesButton(
          text: 'Да',
          isEnabled: true,
          onPressed: () {
            gameState.updateStage(GameStage.Judgement);
            Navigator.pop(context);
          }),
      leftBottomContent: DebatesButton(
          text: 'Нет',
          red: true,
          isEnabled: true,
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
