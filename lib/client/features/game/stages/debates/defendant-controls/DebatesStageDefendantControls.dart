import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/debates/defendant-controls/DabatesStageConfirmMatchingDialog.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';

class DebatesStageDefendantControls extends StatelessWidget {
  const DebatesStageDefendantControls({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;

    final selectedEvent = scenario.eventById[stageState.selectedEventId];

    return Container(
      child: Column(
        children: [
          DebatesButton(
            isEnabled: selectedEvent != null &&
                stageState.selectedEvidenceId != null &&
                stageState.inDenial != true,
            onPressed: () {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const Dialog(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        child: SizedBox(
                            width: 400,
                            height: 150,
                            child: DabatesStageConfirmMatchingDialog()),
                      ));
            },
            text: 'Опровергнуть',
          ),
        ],
      ),
    );
  }
}
