import 'package:flutter/material.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      bodyContent: GameDescription(child: 'Вы уверены, что хотите выйти?'),
      leftBottomContent: TextButton(
        onPressed: () {
          // Navigator.pop(context);
        },
        child: const Text('Назад'),
      ),
      rightBottomContent: TextButton(
        onPressed: () {},
        child: const Text('Выйти'),
      ),
    );
  }
}
