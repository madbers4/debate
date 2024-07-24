import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventAddEvedenceEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventChangeEventEffect.dart';

class DebatesStageConfirmedOverlayChangeEvent extends StatefulWidget {
  final bool isVisible;
  final TransitionEventChangeEventEffect effect;

  const DebatesStageConfirmedOverlayChangeEvent(
      {super.key, required this.isVisible, required this.effect});

  @override
  State<DebatesStageConfirmedOverlayChangeEvent> createState() => _State();
}

class _State extends State<DebatesStageConfirmedOverlayChangeEvent> {
  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;

    final selectedEvent = scenario.eventById[stageState.selectedEventId];

    if (selectedEvent == null) {
      return Container();
    }

    return TransparentPointer(
      transparent: !widget.isVisible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: widget.isVisible ? 1.0 : 0.0,
        child: SizedBox(
            width: 450,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FactCard(
                  fact: selectedEvent,
                  isTransparent: true,
                  isDisabled: true,
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: whiteColor,
                  size: 75,
                ),
                FactCard(
                  fact: widget.effect.event,
                  isTransparent: false,
                  isDisabled: true,
                )
              ],
            )),
      ),
    );
  }
}
