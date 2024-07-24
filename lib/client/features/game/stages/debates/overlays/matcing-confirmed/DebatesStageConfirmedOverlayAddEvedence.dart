import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventAddEvedenceEffect.dart';

class DebatesStageConfirmedOverlayAddEvedence extends StatefulWidget {
  final bool isVisible;
  final List<TransitionEventAddEvedencesEffect> effects;

  const DebatesStageConfirmedOverlayAddEvedence(
      {super.key, required this.isVisible, required this.effects});

  @override
  State<DebatesStageConfirmedOverlayAddEvedence> createState() => _State();
}

class _State extends State<DebatesStageConfirmedOverlayAddEvedence> {
  @override
  Widget build(BuildContext context) {
    final evedences = widget.effects.expand((e) => e.evedences);

    return TransparentPointer(
      transparent: !widget.isVisible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: widget.isVisible ? 1.0 : 0.0,
        child: SizedBox(
            width:
                (widthBySize[GameCardWidgetSize.S267]! + 30) * evedences.length,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: evedences
                  .map((e) => EvidenceCard(
                        evedence: e,
                        isCardCardFlipped: false,
                      ))
                  .toList(),
            )),
      ),
    );
  }
}
