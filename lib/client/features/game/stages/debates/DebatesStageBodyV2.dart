import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStageActTile.dart';

class DebatesStageBodyV2 extends StatelessWidget {
  const DebatesStageBodyV2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(top: 30, left: 30, width: 600, child: DebatesStageActTile())
      ],
    );
  }
}
