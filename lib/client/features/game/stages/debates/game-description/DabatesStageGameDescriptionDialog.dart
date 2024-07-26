import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/dialog/DialogLayout.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/title/TitleStageBody.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';

class DabatesStageGameDescriptionDialog extends StatelessWidget {
  const DabatesStageGameDescriptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final scenario = game.scenario;
    final description = scenario.description;

    return DialogLayout(
      bodyContent: Stack(
        children: [
          Positioned(
            child: TitleStageBody(
                title: description.title,
                description: description.description,
                isDescriptionShowed: true),
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
