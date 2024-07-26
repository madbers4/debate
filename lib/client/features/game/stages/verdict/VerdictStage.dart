import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/verdict/VerdictStageBody.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

class VerdictStage extends StatelessWidget {
  const VerdictStage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();

    return ScreenLayout(
      bodyContent: const VerdictStageBody(),
      background: 'black.png',
      leftBottomContent: roomsState.selectedRole is Plaintiff
          ? TextButton(
              child: const Text('Выйти'),
              onPressed: () {
                gameState.exit();
              },
            )
          : Container(),
    );
  }
}
