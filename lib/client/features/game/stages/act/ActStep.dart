import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/act/ActStepCards.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class ActStage extends StatelessWidget {
  const ActStage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Stack(
      children: [
        // Title
        Container(),
        // Description
        Container(),
        // Cards
        ActStageCards()
      ],
    );
  }
}
