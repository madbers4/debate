import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/widgets/card-slot/CardSlot.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/player/Defendant.dart';

class DebatesStageMatchingTile extends StatelessWidget {
  const DebatesStageMatchingTile({super.key});

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

    return Stack(
      children: [
        Positioned(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardSlot(
              type: GameCardType.Event,
              onAccept: roomsState.selectedRole is Defendant
                  ? (DragTargetDetails<GameCard> card) {
                      if (scenario.eventById[card.data.id] == null ||
                          stageState.inDenial == true) {
                        return;
                      }

                      gameState.updateGameState(GameStageStates.fromExisting(
                          game.stageStates,
                          DebatesStageState.fromJson({
                            ...stageState.toJson(),
                            'selectedEventId': card.data.id
                          })));
                    }
                  : null,
              onLeave: (c) {
                if (c != null && stageState.selectedEventId == c.id) {
                  gameState.updateGameState(GameStageStates.fromExisting(
                      game.stageStates,
                      DebatesStageState.fromJson({
                        ...stageState.toJson(),
                        'selectedEventId': null,
                      })));
                }
              },
              child: selectedEvent != null
                  ? FactCard(
                      fact: selectedEvent,
                      fullTransparent:
                          stageState.inDenial == true ? false : true,
                      isTransparent: stageState.inDenial,
                      isDisabled: roomsState.selectedRole is! Defendant ||
                          stageState.inDenial == true)
                  : null,
            ),
            CardSlot(
              type: GameCardType.Evidence,
              onAccept: roomsState.selectedRole is Defendant
                  ? (DragTargetDetails<GameCard> card) {
                      if (scenario.evidenceById[card.data.id] == null ||
                          stageState.inDenial == true) {
                        return;
                      }

                      gameState.updateGameState(GameStageStates.fromExisting(
                          game.stageStates,
                          DebatesStageState.fromJson({
                            ...stageState.toJson(),
                            'selectedEvidenceId': card.data.id,
                          })));
                    }
                  : null,
              onLeave: (c) {
                if (c != null && stageState.selectedEvidenceId == c.id) {
                  gameState.updateGameState(GameStageStates.fromExisting(
                      game.stageStates,
                      DebatesStageState.fromJson({
                        ...stageState.toJson(),
                        'selectedEvidenceId': null,
                      })));
                }
              },
              child: selectedEvidence != null
                  ? EvidenceCard(
                      evedence: selectedEvidence,
                      fullTransparent:
                          stageState.inDenial == true ? false : true,
                      isTransparent: stageState.inDenial,
                      isDisabled: roomsState.selectedRole is! Defendant ||
                          stageState.inDenial == true,
                    )
                  : null,
            ),
          ],
        ))
      ],
    );
  }
}
