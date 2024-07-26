import 'package:flutter/material.dart';
import 'package:v1/client/features/game/stages/debates/defendant-description/DabatesStageDefendantDescriptionDialog.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';

class DebatesStageDefendantDescriptionButton extends StatelessWidget {
  const DebatesStageDefendantDescriptionButton({super.key});

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
                      child: const DabatesStageDefendantDescriptionDialog()),
                ));
      },
      fontSize: 12,
      text: 'Обвиняемый',
    );
  }
}
