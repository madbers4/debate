import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/debates/defendant-controls/DabatesStageConfirmMatchingDialog.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioTruthyEvedence.dart';
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
          DebatesButton(
            isEnabled: selectedEvent != null &&
                stageState.selectedEvidenceId != null &&
                stageState.inDenial != true,
            onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => const Dialog(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      child: SizedBox(
                          width: 400,
                          height: 150,
                          child: DabatesStageConfirmMatchingDialog()),
                    )),
            text: 'Опровергнуть',
          ),
        ],
      ),
    );
  }
}
