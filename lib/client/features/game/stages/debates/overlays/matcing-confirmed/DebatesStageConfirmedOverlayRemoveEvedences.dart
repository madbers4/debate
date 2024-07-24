import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/scenarious/ScenariousSceen.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventRemoveEvedenceEffect.dart';

class DebatesStageConfirmedOverlayRemoveEvedences extends StatefulWidget {
  final bool isVisible;
  final List<TransitionEventRemoveEvedenceEffect> effects;

  const DebatesStageConfirmedOverlayRemoveEvedences(
      {super.key, required this.isVisible, required this.effects});

  @override
  State<DebatesStageConfirmedOverlayRemoveEvedences> createState() => _State();
}

class _State extends State<DebatesStageConfirmedOverlayRemoveEvedences> {
  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;

    final evedences = widget.effects
        .expand((e) => e.evedenceIds)
        .map((id) => scenario.evidenceById[id]!);

    final sbWidth =
        (widthBySize[GameCardWidgetSize.S267]! + 30) * evedences.length;

    return TransparentPointer(
      transparent: !widget.isVisible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: widget.isVisible ? 1.0 : 0.0,
        child: SizedBox(
            width: sbWidth > 450 ? sbWidth : 450,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: evedences.length == 1
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: evedences
                    .map((e) => EvidenceCard(
                          evedence: e,
                          isTransparent: true,
                          isDisabled: true,
                        ))
                    .toList())),
      ),
    );
  }
}
