import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/debates/overlays/matcing-confirmed/DebatesStageConfirmedOverlayAddEvedence.dart';
import 'package:v1/client/features/game/stages/debates/overlays/matcing-confirmed/DebatesStageConfirmedOverlayChangeAct.dart';
import 'package:v1/client/features/game/stages/debates/overlays/matcing-confirmed/DebatesStageConfirmedOverlayChangeEvent.dart';
import 'package:v1/client/features/game/stages/debates/overlays/matcing-confirmed/DebatesStageConfirmedOverlayChangedCards.dart';
import 'package:v1/client/features/game/stages/debates/overlays/matcing-confirmed/DebatesStageConfirmedOverlayRemoveEvedences.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';

import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/widgets/buttons/back/BackButton.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioTruthyEvedence.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEvent.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventAddEvedenceEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventChangeActEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventChangeEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventRemoveEvedenceEffect.dart';
import 'package:v1/common/utils/generateUID.dart';

class DebatesStageConfirmedOverlay extends StatefulWidget {
  const DebatesStageConfirmedOverlay({super.key});

  @override
  State<DebatesStageConfirmedOverlay> createState() => _State();
}

class _State extends State<DebatesStageConfirmedOverlay> {
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

    List<TransitionEvent> transitions = [];

    if (selectedEvidence is ScenarioTruthyEvedence) {
      transitions.add(scenario
          .transitionEventById[selectedEvidence.triggeredTransitionId]!);
    }

    if (scenario.evedences.where((e) => e is ScenarioTruthyEvedence).length ==
            1 &&
        scenario.transitionEvents.any((e) => e.afterNoEvedenceLeft == true)) {
      transitions.add(scenario.transitionEvents
          .firstWhere((e) => e.afterNoEvedenceLeft == true));
    }

    final effects = transitions.expand((e) => e.effects).toList();

    if (selectedEvidence is ScenarioTruthyEvedence) {
      effects.add(TransitionEventRemoveEvedenceEffect(
          id: 'rem-1', evedenceIds: [selectedEvidence.id]));
    }

    List<TransitionEventAddEvedencesEffect> addEvedencesEffects =
        effects.whereType<TransitionEventAddEvedencesEffect>().toList();
    List<TransitionEventChangeActEffect> changeActEffects =
        effects.whereType<TransitionEventChangeActEffect>().toList();
    List<TransitionEventChangeEventEffect> changeEventEffect =
        effects.whereType<TransitionEventChangeEventEffect>().toList();
    List<TransitionEventRemoveEvedenceEffect> removeEvedenceEffect =
        effects.whereType<TransitionEventRemoveEvedenceEffect>().toList();

    int pages = 1 +
        (addEvedencesEffects.isNotEmpty ? 1 : 0) +
        changeActEffects.length +
        changeEventEffect.length +
        (removeEvedenceEffect.isNotEmpty ? 1 : 0);

    int pageId = 0;
    int descriptionId = 0;

    bool endGame = transitions.any((e) => e.endGame == true);

    if (endGame) {
      pages = 1;
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
                Container(
                  height: 25,
                ),
                Container(
                  width: 800,
                  child: Stack(
                    children: [
                      AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: stageState.denialConfirmedCurrentPage ==
                                  descriptionId++
                              ? 1.0
                              : 0.0,
                          child: Center(
                            child: GameDescription(
                                fontSize: 14.5,
                                child:
                                    selectedEvidence is ScenarioTruthyEvedence
                                        ? selectedEvidence.falsyDescription
                                        : '...'),
                          )),
                      ...changeActEffects.map((e) => AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: stageState.denialConfirmedCurrentPage ==
                                  descriptionId++
                              ? 1.0
                              : 0.0,
                          child: Center(
                            child: GameDescription(
                                fontSize: 18,
                                child: 'Описание Акта ${e.actId} изменено'),
                          ))),
                      ...changeEventEffect.map((e) => AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: stageState.denialConfirmedCurrentPage ==
                                  descriptionId++
                              ? 1.0
                              : 0.0,
                          child: const Center(
                            child: GameDescription(
                                fontSize: 18, child: 'Событие изменено'),
                          ))),
                      addEvedencesEffects.isNotEmpty
                          ? AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: stageState.denialConfirmedCurrentPage ==
                                      descriptionId++
                                  ? 1.0
                                  : 0.0,
                              child: const Center(
                                child: GameDescription(
                                    fontSize: 18, child: 'Улики добавлены'),
                              ))
                          : Container(),
                      removeEvedenceEffect.isNotEmpty
                          ? AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: stageState.denialConfirmedCurrentPage ==
                                      descriptionId++
                                  ? 1.0
                                  : 0.0,
                              child: const Center(
                                child: GameDescription(
                                    fontSize: 18, child: 'Улики удалены'),
                              ))
                          : Container(),
                    ],
                  ),
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
                Container(
                  width: 10,
                ),
                // NOTE: Не заменять
                Container(
                  width: 800,
                  child: Stack(
                    children: [
                      Center(
                        child: DebatesStageConfirmedOverlayChangedCards(
                          isVisible:
                              stageState.denialConfirmedCurrentPage == pageId++,
                        ),
                      ),
                      ...changeActEffects.map((e) => Center(
                              child: DebatesStageConfirmedOverlayChangeAct(
                            key: Key(e.id),
                            isVisible: stageState.denialConfirmedCurrentPage ==
                                pageId++,
                            effect: e,
                          ))),
                      ...changeEventEffect.map((e) => Center(
                              child: DebatesStageConfirmedOverlayChangeEvent(
                            key: Key(e.id),
                            isVisible: stageState.denialConfirmedCurrentPage ==
                                pageId++,
                            effect: e,
                          ))),
                      addEvedencesEffects.isNotEmpty
                          ? Center(
                              child: DebatesStageConfirmedOverlayAddEvedence(
                              isVisible:
                                  stageState.denialConfirmedCurrentPage ==
                                      pageId++,
                              effects: addEvedencesEffects,
                            ))
                          : Container(),
                      removeEvedenceEffect.isNotEmpty
                          ? Center(
                              child:
                                  DebatesStageConfirmedOverlayRemoveEvedences(
                              isVisible:
                                  stageState.denialConfirmedCurrentPage ==
                                      pageId++,
                              effects: removeEvedenceEffect,
                            ))
                          : Container(),
                    ],
                  ),
                ),
                Container(
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
                    }),
              ],
            ))),
        stageState.denialConfirmedCurrentPage == pages - 1 && !endGame
            ? Positioned(
                top: 530,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DebatesButton(
                      isEnabled: true,
                      onPressed: () {
                        Game updatedGame = game;

                        for (final effect in effects) {
                          updatedGame = effect.updateGame(updatedGame);
                        }

                        final updatedGameJson = updatedGame.toJson();

                        updatedGame = Game.fromJson({
                          ...updatedGameJson,
                          'stageStates': {
                            ...updatedGameJson['stageStates']
                                as Map<dynamic, dynamic>,
                            'debates': {
                              ...updatedGameJson['stageStates']['debates']
                                  as Map<dynamic, dynamic>,
                              'inDenialConfirmed': false,
                              'selectedEventId': null,
                              'selectedEvidenceId': null
                            }
                          },
                          'scenario': {
                            ...updatedGameJson['scenario']
                                as Map<dynamic, dynamic>,
                            'transitionEvents': (updatedGameJson['scenario']
                                    ['transitionEvents'] as List<dynamic>)
                                .where((e) => !transitions
                                    .any((element) => element.id == e['id']))
                          }
                        });

                        // print(updatedGame);
                        gameState.updateGame(updatedGame);
                      },
                      text: 'Продолжить',
                    )
                  ],
                ),
              )
            : Container(),
        stageState.denialConfirmedCurrentPage == pages - 1 && endGame
            ? Positioned(
                top: 530,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DebatesButton(
                      isEnabled: true,
                      onPressed: () {
                        gameState.updateStage(GameStage.Judgement);
                      },
                      text: 'Перейти к приговору',
                    )
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}
