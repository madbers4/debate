import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/act/ActStepCards.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class EvidencesStage extends StatelessWidget {
  const EvidencesStage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Stack(
      children: [
        // Title
        Container(),
        // Cards
        ActStageCards()
      ],
    );
  }
}
