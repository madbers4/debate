import 'package:flutter/material.dart';

import 'package:v1/client/features/game/stages/debates/game-description/DabatesStageGameDescriptionDialog.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';

class DebatesStageGameDescriptionButton extends StatelessWidget {
  const DebatesStageGameDescriptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DebatesButton(
      isEnabled: true,
      onPressed: () {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog(
                  backgroundColor: Colors.transparent,
                  shadowColor: Color.fromARGB(244, 0, 0, 0),
                  surfaceTintColor: Colors.transparent,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const DabatesStageGameDescriptionDialog()),
                ));
      },
      fontSize: 12,
      text: 'Описание',
    );
  }
}
