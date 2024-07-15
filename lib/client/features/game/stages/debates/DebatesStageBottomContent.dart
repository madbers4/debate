import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/features/player/Defendant.dart';

class DebatesStageBottomContent extends StatelessWidget {
  const DebatesStageBottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final roomsState = context.watch<RoomsState>();

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
                      size: GameCardWidgetSize.S267,
                      isTransparent: stageState.selectedEvidenceId == e.id,
                      isDisabled: roomsState.selectedRole is! Defendant ||
                          stageState.selectedEvidenceId == e.id,
                    ))
                .toList()));
  }
}
