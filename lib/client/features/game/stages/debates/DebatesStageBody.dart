import 'package:flutter/material.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/act-tile/ActTile.dart';
import 'package:v1/client/features/game/widgets/card-slot/CardSlot.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioFalsyEvedence.dart';
import 'package:v1/common/features/scenario/event/ScenarioFalsyEvent.dart';

class DebatesStageBody extends StatelessWidget {
  const DebatesStageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;

    final List<String> hiddenActIds =
        stageState.selectedEventId != null ? [stageState.selectedEventId!] : [];

    final selectedEvent = scenario.eventById[stageState.selectedEventId];
    final selectedEvidence =
        scenario.evidenceById[stageState.selectedEvidenceId];

    final isCardMatched = selectedEvent is ScenarioFalsyEvent &&
        selectedEvidence is ScenarioTruthyEvedence &&
        selectedEvidence.falsyEventId == selectedEvent.id;

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
                    onAccept: roomsState.selectedRole is Defendant
                        ? (DragTargetDetails<GameCard> card) {
                            if (scenario.eventById[card.data.id] == null) {
                              return;
                            }

                            gameState.updateGameState(
                                GameStageStates.fromExisting(
                                    game.stageStates,
                                    DebatesStageState(
                                        id: stageState.id,
                                        selectedEvidenceId:
                                            stageState.selectedEvidenceId,
                                        selectedEventId: card.data.id)));
                          }
                        : null,
                    child: selectedEvent != null
                        ? FactCard(
                            fact: selectedEvent,
                            isDisabled: roomsState.selectedRole is! Defendant)
                        : null,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CardSlot(
                    onAccept: roomsState.selectedRole is Defendant
                        ? (DragTargetDetails<GameCard> card) {
                            if (scenario.evidenceById[card.data.id] == null) {
                              return;
                            }

                            gameState.updateGameState(
                                GameStageStates.fromExisting(
                                    game.stageStates,
                                    DebatesStageState(
                                        id: stageState.id,
                                        selectedEvidenceId: card.data.id,
                                        selectedEventId:
                                            stageState.selectedEventId)));
                          }
                        : null,
                    child: selectedEvidence != null
                        ? EvidenceCard(
                            evedence: selectedEvidence,
                            isDisabled: roomsState.selectedRole is! Defendant,
                          )
                        : null,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              roomsState.selectedRole is Defendant
                  ? Column(
                      children: [
                        TextButton(
                          onPressed: selectedEvent != null &&
                                  stageState.selectedEvidenceId != null &&
                                  stageState.inDenial != true
                              ? () {
                                  gameState.updateGameState(
                                      GameStageStates.fromExisting(
                                          game.stageStates,
                                          DebatesStageState(
                                              id: stageState.id,
                                              inDenial: true,
                                              selectedEventId:
                                                  stageState.selectedEventId,
                                              selectedEvidenceId:
                                                  stageState.selectedEvidenceId,
                                              incorrectAttempts:
                                                  stageState.incorrectAttempts,
                                              refusedEvents:
                                                  stageState.refusedEvents)));
                                }
                              : null,
                          child: const Text('Опровергнуть'),
                        ),
                      ],
                    )
                  : Container(),
              roomsState.selectedRole is Plaintiff &&
                      stageState.inDenial == true &&
                      isCardMatched
                  ? Column(
                      children: [
                        Text(
                          'Доказательство действительно опровергает данное событие',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        selectedEvent.confirmsInnocence == true
                            ? Text(
                                'Опровержение подтвердит невиновность обвиняемого',
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            : Container(),
                        TextButton(
                          onPressed: stageState.inDenial == true
                              ? () {
                                  gameState.updateGameState(
                                      GameStageStates.fromExisting(
                                          game.stageStates,
                                          DebatesStageState(
                                              id: stageState.id,
                                              inDenial: false,
                                              selectedEventId:
                                                  stageState.selectedEventId,
                                              selectedEvidenceId:
                                                  stageState.selectedEvidenceId,
                                              incorrectAttempts:
                                                  stageState.incorrectAttempts,
                                              refusedEvents: [
                                                ...stageState.refusedEvents,
                                                selectedEvent.id
                                              ])));
                                }
                              : null,
                          child: const Text('Принять'),
                        )
                      ],
                    )
                  : Container(),
              roomsState.selectedRole is Plaintiff &&
                      stageState.inDenial == true &&
                      !isCardMatched
                  ? Column(
                      children: [
                        Text(
                          'Это доказательство не может опровергнуть данное событие',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        TextButton(
                          onPressed: () {
                            final incorrectAttempts =
                                stageState.incorrectAttempts + 1;
                            gameState
                                .updateGameState(GameStageStates.fromExisting(
                                    game.stageStates,
                                    DebatesStageState(
                                      id: stageState.id,
                                      inDenial: false,
                                      selectedEventId:
                                          stageState.selectedEventId,
                                      selectedEvidenceId:
                                          stageState.selectedEvidenceId,
                                      incorrectAttempts: incorrectAttempts,
                                      isDebatesOver: incorrectAttempts > 3,
                                      refusedEvents: stageState.refusedEvents,
                                    )));
                          },
                          child: const Text('Отклонить'),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        )
      ],
    );
  }
}
