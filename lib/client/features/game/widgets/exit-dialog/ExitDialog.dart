import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/features/dialog/DialogLayout.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();

    return DialogLayout(
      bodyContent: const TransparentPointer(
          transparent: true,
          child: GameDescription(child: 'Вы уверены, что хотите выйти?')),
      leftBottomContent: DebatesButton(
        isEnabled: true,
        onPressed: () {
          Navigator.pop(context);
        },
        text: 'Назад',
      ),
      rightBottomContent: DebatesButton(
        isEnabled: true,
        red: true,
        onPressed: () {
          gameState.exit();
        },
        text: 'Выйти',
      ),
    );
  }
}
