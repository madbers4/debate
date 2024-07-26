import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/game/widgets/cards/FactCard.dart';

class DebatesStageConfirmedOverlayChangedCards extends StatefulWidget {
  final bool isVisible;
  const DebatesStageConfirmedOverlayChangedCards(
      {super.key, required this.isVisible});

  @override
  State<DebatesStageConfirmedOverlayChangedCards> createState() => _State();
}

class _State extends State<DebatesStageConfirmedOverlayChangedCards> {
  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;

    final selectedEvent = scenario.eventById[stageState.selectedEventId];
    final selectedEvidence =
        scenario.evidenceById[stageState.selectedEvidenceId];

    if (selectedEvidence == null || selectedEvent == null) {
      return Container();
    }

    return TransparentPointer(
      transparent: !widget.isVisible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: widget.isVisible ? 1.0 : 0.0,
        child: Container(
            width: 450,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FactCard(
                  fact: selectedEvent,
                  isTransparent: false,
                  isDisabled: true,
                ),
                const Icon(
                  Icons.check_circle,
                  color: greenColor,
                  size: 75,
                ),
                EvidenceCard(
                  evedence: selectedEvidence,
                  isTransparent: false,
                  isDisabled: true,
                )
              ],
            )),
      ),
    );
  }
}
