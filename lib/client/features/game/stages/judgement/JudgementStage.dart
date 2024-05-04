import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class JudgementStage extends StatelessWidget {
  const JudgementStage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Stack(
      children: [
        // Title
        Container(),
        // Признать виновным
        Container(),
        // Признать невиновным
        Container(),
      ],
    );
  }
}
