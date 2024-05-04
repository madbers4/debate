import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/defender/DefenderStageCards.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class DefenderStage extends StatelessWidget {
  const DefenderStage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Stack(
      children: [
        // Title
        Container(),
        // Description
        Container(),
        // Defender Cards Stage
        DefenderStageCards()
      ],
    );
  }
}
