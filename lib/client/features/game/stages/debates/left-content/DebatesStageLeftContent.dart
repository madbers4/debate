import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/cards/OriginCard.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/features/player/Defendant.dart';

class DebatesStageLeftContent extends StatelessWidget {
  const DebatesStageLeftContent({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
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
              origin: game.scenario.defendant.bornOrigin,
              isDisabled: true,
              size: GameCardWidgetSize.S221,
            ),
            OriginCard(
              origin: game.scenario.defendant.professionOrigin,
              isDisabled: true,
              size: GameCardWidgetSize.S221,
            ),
            OriginCard(
              origin: game.scenario.defendant.secretOrigin,
              isCardCardFlipped:
                  roomsState.selectedRole is Defendant ? false : true,
              isDisabled: true,
              size: GameCardWidgetSize.S221,
            ),
          ],
        ));
  }
}
