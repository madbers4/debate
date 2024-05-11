import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStage.dart';
import 'package:v1/client/features/game/stages/judgement/JudgementStage.dart';

import 'package:v1/client/widgets/style/Palette.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return ChangeNotifierProvider(
        create: (context) => GameState(context),
        builder: (context, child) {
          final state = context.watch<GameState>();

          return JudgementStage();
        });
  }
}