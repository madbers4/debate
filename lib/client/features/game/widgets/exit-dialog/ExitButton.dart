import 'package:flutter/material.dart';
import 'package:v1/client/features/game/widgets/exit-dialog/ExitDialog.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Transform.scale(scaleX: -1, child: const Icon(Icons.exit_to_app)),
      tooltip: 'Выйти',
      onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => const Dialog(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                child: SizedBox(width: 400, height: 150, child: ExitDialog()),
              )),
    );
  }
}
