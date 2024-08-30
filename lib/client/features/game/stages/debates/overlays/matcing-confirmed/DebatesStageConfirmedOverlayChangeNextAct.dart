import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';

class DebatesStageConfirmedOverlayChangeNextAct extends StatefulWidget {
  final bool isVisible;
  final String actId;

  const DebatesStageConfirmedOverlayChangeNextAct(
      {super.key, required this.isVisible, required this.actId});

  @override
  State<DebatesStageConfirmedOverlayChangeNextAct> createState() => _State();
}

class _State extends State<DebatesStageConfirmedOverlayChangeNextAct> {
  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final scenario = game.scenario;

    final act = scenario.acts.firstWhere((a) => a.id == widget.actId);

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
                  fontSize: 24,
                ),
                Container(
                  height: 10,
                ),
                GameDescription(
                  child: act.description,
                  fontSize: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
