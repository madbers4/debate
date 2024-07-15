import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioFalsyEvedence.dart';
import 'package:v1/common/features/scenario/event/ScenarioFalsyEvent.dart';

class DebatesStageDefendantControls extends StatelessWidget {
  const DebatesStageDefendantControls({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;

    final selectedEvent = scenario.eventById[stageState.selectedEventId];
    final selectedEvidence =
        scenario.evidenceById[stageState.selectedEvidenceId];

    final isCardMatched = selectedEvent is ScenarioFalsyEvent &&
        selectedEvidence is ScenarioTruthyEvedence &&
        selectedEvidence.falsyEventId == selectedEvent.id;

    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: selectedEvent != null &&
                    stageState.selectedEvidenceId != null &&
                    stageState.inDenial != true
                ? () {
                    gameState.updateGameState(GameStageStates.fromExisting(
                        game.stageStates,
                        DebatesStageState.fromJson({
                          ...stageState.toJson(),
                          'inDenial': true,
                        })));
                  }
                : null,
            child: const Text('Опровергнуть'),
          ),
        ],
      ),
    );
  }
}
