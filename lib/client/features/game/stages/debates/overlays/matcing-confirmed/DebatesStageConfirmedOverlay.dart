import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/debates/overlays/matcing-confirmed/DebatesStageConfirmedOverlayChangedCards.dart';

import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/widgets/buttons/back/BackButton.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioFalsyEvedence.dart';

class DebatesStageConfirmedOverlay extends StatefulWidget {
  const DebatesStageConfirmedOverlay({super.key});

  @override
  State<DebatesStageConfirmedOverlay> createState() => _State();
}

class _State extends State<DebatesStageConfirmedOverlay> {
  int pages = 2;

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;

    final selectedEvent = scenario.eventById[stageState.selectedEventId];
    final selectedEvidence =
        scenario.evidenceById[stageState.selectedEvidenceId];

    if (selectedEvidence == null || selectedEvent == null) {
      return Container();
    }

    return Stack(
      children: [
        Positioned(
          top: 75,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                const GameTitle(
                  child: 'Улика опровергает это событие',
                  fontSize: 45,
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 800,
                  child: GameDescription(
                      fontSize: 14.5,
                      child: selectedEvidence is ScenarioTruthyEvedence
                          ? selectedEvidence.falsyDescription
                          : '...'),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: 230,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BackButton2(
                    isHidden: stageState.denialConfirmedCurrentPage == 0,
                    onPressed: () {
                      gameState.updateGameState(GameStageStates.fromExisting(
                          game.stageStates,
                          DebatesStageState.fromJson({
                            ...stageState.toJson(),
                            'denialConfirmedCurrentPage':
                                stageState.denialConfirmedCurrentPage - 1,
                          })));
                    }),
                const SizedBox(
                  width: 10,
                ),
                DebatesStageConfirmedOverlayChangedCards(
                  isVisible: stageState.denialConfirmedCurrentPage == 0,
                ),
                const SizedBox(
                  width: 10,
                ),
                NextButton(
                    isHidden:
                        stageState.denialConfirmedCurrentPage + 1 >= pages,
                    onPressed: () {
                      gameState.updateGameState(GameStageStates.fromExisting(
                          game.stageStates,
                          DebatesStageState.fromJson({
                            ...stageState.toJson(),
                            'denialConfirmedCurrentPage':
                                stageState.denialConfirmedCurrentPage + 1,
                          })));
                    })
              ],
            ))),
      ],
    );
  }
}
