import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/act-tile/ActTile.dart';
import 'package:v1/client/features/game/widgets/card-slot/CardSlot.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';

class DebatesStageBody extends StatelessWidget {
  const DebatesStageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;

    final List<String> hiddenActIds =
        stageState.selectedEventId != null ? [stageState.selectedEventId!] : [];

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
            top: 0,
            left: 0,
            child: ActTile(
              actId: 'I',
              event: scenario.acts[0],
              hiddenIds: hiddenActIds,
            )),
        Positioned(
            top: 0,
            right: 0,
            child: ActTile(
              actId: 'I',
              event: scenario.acts[1],
              hiddenIds: hiddenActIds,
            )),
        Positioned(
            bottom: 0,
            left: 0,
            child: ActTile(
              actId: 'I',
              event: scenario.acts[2],
              hiddenIds: hiddenActIds,
            )),
        Positioned(
            bottom: 0,
            right: 0,
            child: ActTile(
              actId: 'I',
              event: scenario.acts[3],
              hiddenIds: hiddenActIds,
            )),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardSlot(
                    child: stageState.selectedEventId != null
                        ? FactCard(
                            fact:
                                scenario.eventById[stageState.selectedEventId]!)
                        : null,
                    onAccept: (DragTargetDetails<GameCard> card) {
                      if (scenario.eventById[card.data.id] == null) {
                        return;
                      }

                      gameState.updateGameState(GameStageStates.fromExisting(
                          game.stageStates,
                          DebatesStageState(
                              id: stageState.id,
                              selectedEvidenceId: stageState.selectedEvidenceId,
                              selectedEventId: card.data.id)));
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CardSlot(
                    child: stageState.selectedEvidenceId != null
                        ? EvidenceCard(
                            evedence: scenario
                                .evidenceById[stageState.selectedEvidenceId]!)
                        : null,
                    onAccept: (DragTargetDetails<GameCard> card) {
                      if (scenario.evidenceById[card.data.id] == null) {
                        return;
                      }

                      gameState.updateGameState(GameStageStates.fromExisting(
                          game.stageStates,
                          DebatesStageState(
                              id: stageState.id,
                              selectedEvidenceId: card.data.id,
                              selectedEventId: stageState.selectedEventId)));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                child: const Text('Принять'),
                onPressed: () {
                  gameState.updateStage(GameStage.Judgement);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                child: const Text('Отклонить'),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
