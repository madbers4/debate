import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventChangeActEffect.dart';

class DebatesStageConfirmedOverlayChangeAct extends StatefulWidget {
  final bool isVisible;
  final TransitionEventChangeActEffect effect;

  const DebatesStageConfirmedOverlayChangeAct(
      {super.key, required this.isVisible, required this.effect});

  @override
  State<DebatesStageConfirmedOverlayChangeAct> createState() => _State();
}

class _State extends State<DebatesStageConfirmedOverlayChangeAct> {
  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;

    final act = scenario.acts.firstWhere((a) => a.id == widget.effect.actId);

    return TransparentPointer(
      transparent: !widget.isVisible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: widget.isVisible ? 1.0 : 0.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                GameTitle(
                  child: act.title,
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 10,
                ),
                GameDescription(
                  child: act.description,
                  fontSize: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Icon(
              Icons.arrow_downward_rounded,
              color: whiteColor,
              size: 75,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                GameTitle(
                  child: widget.effect.title ?? act.title,
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 10,
                ),
                GameDescription(
                  child: widget.effect.description ?? act.description,
                  fontSize: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
