import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/debates/defendant-controls/DabatesStageConfirmMatchingDialog.dart';
import 'package:v1/client/features/game/stages/debates/plaintiff-controls/DabatesStageConfirmExitDialog.dart';
import 'package:v1/client/features/game/stages/debates/plaintiff-controls/DabatesStageConfirmJudgementDialog.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
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

    return Container(
      width: 200,
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DebatesButton(
            isEnabled: true,
            onPressed: () {
              gameState.updateGameState(GameStageStates.fromExisting(
                  game.stageStates,
                  DebatesStageState.fromJson({
                    ...stageState.toJson(),
                    'inPauseOvrl': true,
                    'inPause': true
                  })));
            },
            text: 'Пауза',
          ),
          const SizedBox(
            width: 10,
          ),
          DebatesButton(
            isEnabled: true,
            red: true,
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
                            child: DabatesStageConfirmJudgementDialog()),
                      ));
            },
            text: 'Перейти к приговору',
          ),
          const SizedBox(
            width: 10,
          ),
          DebatesButton(
            isEnabled: true,
            red: true,
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
                            child: DabatesStageConfirmExitDialog()),
                      ));
            },
            text: 'Выйти',
          ),
        ],
      ),
    );
  }
}
