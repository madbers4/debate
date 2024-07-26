import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/features/dialog/DialogLayout.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';

class DabatesStageConfirmExitDialog extends StatelessWidget {
  const DabatesStageConfirmExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;

    return DialogLayout(
      bodyContent: const TransparentPointer(
          child: GameDescription(child: 'Вы уверены что хотите ЗАКРЫТЬ игру?')),
      rightBottomContent: DebatesButton(
          text: 'Да',
          isEnabled: true,
          onPressed: () {
            gameState.exit();
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
