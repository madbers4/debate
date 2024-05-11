import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class ActStageCards extends StatelessWidget {
  const ActStageCards({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Stack(
      children: [
        // Card 1
        Container(),
        // Card 2
        Container(),
        // Defendant Cards Stage
      ],
    );
  }
}
