import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioTruthyEvedence.dart';
import 'package:v1/common/features/scenario/event/ScenarioFalsyEvent.dart';

class DebatesStagePlaintiffControls extends StatelessWidget {
  const DebatesStagePlaintiffControls({super.key});

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

    return Container();
  }
}
