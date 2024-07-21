import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/client/features/game/widgets/debates-button/DebatesButton.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioFalsyEvedence.dart';
import 'package:v1/common/features/scenario/event/ScenarioFalsyEvent.dart';

class DebatesStageMatchingOverlay extends StatefulWidget {
  const DebatesStageMatchingOverlay({super.key});

  @override
  State<DebatesStageMatchingOverlay> createState() => _State();
}

class _State extends State<DebatesStageMatchingOverlay> {
  bool doNotReduceAttempts = false;

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

    final isCardMatched = selectedEvent is ScenarioFalsyEvent &&
        selectedEvidence is ScenarioTruthyEvedence &&
        selectedEvidence.falsyEventId == selectedEvent.id;

    if (selectedEvidence == null || selectedEvent == null) {
      return Container();
    }

    return Container(
        child: Stack(
      children: [
        Positioned(
          top: 75,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                const GameTitle(
                  child: 'Дебаты',
                  fontSize: 55,
                ),
                const SizedBox(
                  height: 25,
                ),
                GameDescription(
                    child:
                        'Возможно ли опровергнуть событие "${selectedEvent.title}"?')
              ],
            ),
          ),
        ),
        Positioned(
            top: 230,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: SizedBox(
                    width: 450,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FactCard(
                          fact: selectedEvent,
                          isTransparent: false,
                          isDisabled: true,
                        ),
                        const Icon(
                          Icons.compare_arrows_rounded,
                          color: whiteColor,
                          size: 75,
                        ),
                        EvidenceCard(
                          evedence: selectedEvidence,
                          isTransparent: false,
                          isDisabled: true,
                        )
                      ],
                    )))),
        ...(roomsState.selectedRole is Plaintiff
            ? [
                isCardMatched
                    ? Positioned(
                        top: 505,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            const GameDescription(
                              child:
                                  'Улика действительно опровергает данное событие',
                              fontSize: 14,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 700,
                              child: GameDescription(
                                child: selectedEvidence.falsyDescription,
                                fontSize: 14,
                                red: true,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            selectedEvent.confirmsInnocence == true
                                ? const GameDescription(
                                    red: true,
                                    child:
                                        'Опровержение подтвердит невиновность обвиняемого',
                                    fontSize: 13,
                                  )
                                : Container(),
                            DebatesButton(
                              isEnabled: true,
                              onPressed: () {
                                if (selectedEvent.confirmsInnocence == true) {
                                  gameState.updateStage(GameStage.Judgement);
                                  return;
                                }

                                gameState.updateGameState(
                                    GameStageStates.fromExisting(
                                        game.stageStates,
                                        DebatesStageState.fromJson({
                                          ...stageState.toJson(),
                                          'inDenial': false,
                                          'inDenialConfirmed': true,
                                          'denialConfirmedCurrentPage': 0,
                                        })));
                              },
                              red: selectedEvent.confirmsInnocence == true
                                  ? true
                                  : false,
                              text: selectedEvent.confirmsInnocence == true
                                  ? 'Перейти к приговору'
                                  : 'Продолжить',
                            )
                          ],
                        ))
                    : Container(),
                !isCardMatched
                    ? Positioned(
                        top: 530,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            const GameDescription(
                              red: true,
                              child:
                                  'Доказательство не опровергает это событие',
                              fontSize: 14,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const GameDescription(
                                  child: 'Не уменьшать попытки: ',
                                  fontSize: 14,
                                ),
                                Checkbox(
                                    activeColor: blueColor,
                                    value: doNotReduceAttempts,
                                    onChanged: (en) {
                                      setState(() {
                                        doNotReduceAttempts = en ?? false;
                                      });
                                    }),
                              ],
                            ),
                            DebatesButton(
                              isEnabled: true,
                              onPressed: () {
                                gameState.updateGameState(
                                    GameStageStates.fromExisting(
                                        game.stageStates,
                                        DebatesStageState.fromJson({
                                          ...stageState.toJson(),
                                          'inDenial': false,
                                          'inDenialNotConfirmed': true,
                                          'incorrectAttempts':
                                              doNotReduceAttempts
                                                  ? stageState.incorrectAttempts
                                                  : stageState
                                                          .incorrectAttempts +
                                                      1,
                                          'selectedEventId': null,
                                          'selectedEvidenceId': null
                                        })));
                              },
                              text: 'Принять',
                            )
                          ],
                        ))
                    : Container(),
              ]
            : [])
      ],
    ));
  }
}
