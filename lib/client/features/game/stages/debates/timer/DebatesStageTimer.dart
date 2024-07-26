import 'dart:async';

import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';

class DebatesStageTimer extends StatefulWidget {
  const DebatesStageTimer({super.key});

  @override
  State<DebatesStageTimer> createState() => _State();
}

class _State extends State<DebatesStageTimer> {
  Duration _t = const Duration();
  // Define a Timer object
  Timer? _timer;
  // Define a variable to store the current countdown value

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    _timer?.cancel();
    super.dispose();
  }

  // Method to start the countdown timer
  void startTimer() {
    final gameState = context.watch<GameState>();

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (gameState.gameTime.inSeconds <= 0) {
        // Countdown is finished
        _timer?.cancel();
        // Perform any desired action when the countdown is completed
      } else {
        // Update the countdown value and decrement by 1 second
        gameState.gameTime = gameState.gameTime - const Duration(seconds: 1);

        setState(() {
          _t = gameState.gameTime;
        });
      }
    });
  }

  // Method to start the countdown timer
  void stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game;

    if (game == null) {
      return Container();
    }

    final stageState = game.stageStates.debates;

    if (stageState.inPause) {
      stopTimer();
    } else {
      startTimer();
    }

    if (stageState.isDebatesTimeout != true &&
        gameState.gameTime.inSeconds == 0) {
      gameState.updateGameState(GameStageStates.fromExisting(
          game.stageStates,
          DebatesStageState.fromJson(
              {...stageState.toJson(), 'isDebatesTimeout': true})));
    }

    String minutes = _t.inMinutes.remainder(60).toString().padLeft(1, '0');
    String seconds = _t.inSeconds.remainder(60).toString().padLeft(2, '0');

    return SizedBox(
      width: 77,
      child: GameTitle(
        fontSize: 30,
        textAlign: TextAlign.left,
        child: '$minutes:$seconds',
      ),
    );
  }
}
