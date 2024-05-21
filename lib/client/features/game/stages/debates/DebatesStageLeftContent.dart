import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/cards/OriginCard.dart';

class DebatesStageLeftContent extends StatelessWidget {
  const DebatesStageLeftContent({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;

    return Container(
        height: 400,
        color: Colors.transparent,
        width: 180,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OriginCard(
              title: 'Происхождение',
              origin: game.scenario.defendant.bornOrigin,
            ),
            OriginCard(
                title: 'Профессия',
                origin: game.scenario.defendant.professionOrigin),
            OriginCard(
                title: 'Секрет', origin: game.scenario.defendant.secretOrigin),
          ],
        ));
  }
}
