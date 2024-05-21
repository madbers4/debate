import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/GameRouter.dart';
import 'package:v1/client/features/game/GameState.dart';

import 'package:v1/client/widgets/style/Palette.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final state = context.watch<GameState>();

    return MaterialApp.router(
      routerConfig: gameRouter,
    );
  }
}
