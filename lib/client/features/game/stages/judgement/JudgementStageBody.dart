import 'package:flutter/material.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';

class JudgementStageBody extends StatelessWidget {
  const JudgementStageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: GameTitle(
        child: 'Обвиняемый признан...',
      ),
    );
  }
}
