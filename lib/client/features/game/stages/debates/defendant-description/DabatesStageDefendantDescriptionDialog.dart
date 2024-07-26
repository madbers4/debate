import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/dialog/DialogLayout.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/defendant/DefendantStageBody.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';

class DabatesStageDefendantDescriptionDialog extends StatelessWidget {
  const DabatesStageDefendantDescriptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final scenario = game.scenario;
    final defendant = scenario.defendant;

    return DialogLayout(
      bodyContent: Stack(
        children: [
          Positioned(
            child: DefendantStageBody(
              bornOrigin: defendant.bornOrigin,
              description: defendant.description,
              isCardsShowed: false,
              professionOrigin: defendant.professionOrigin,
              secretOrigin: defendant.secretOrigin,
            ),
          ),
          Positioned(
              top: 500,
              width: MediaQuery.of(context).size.width - 100,
              child: Center(
                child: Container(
                  width: 100,
                  child: DebatesButton(
                    isEnabled: true,
                    text: 'Закрыть',
                    fontSize: 14,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
