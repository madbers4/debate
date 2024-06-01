import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/player/Defendant.dart';

class DebatesStageBottomContent extends StatelessWidget {
  const DebatesStageBottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;

    return Container(
        height: 180,
        color: Colors.transparent,
        width: 400,
        alignment: Alignment.center,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: game.scenario.evedences
                .map((e) => EvidenceCard(
                      evedence: e,
                      isDisabled: roomsState.selectedRole is! Defendant,
                    ))
                .toList()));
  }
}
