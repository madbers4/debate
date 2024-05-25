import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/act/ActStageBody.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/ActStageState.dart';
import 'package:v1/common/features/scenario/ScenarioEvent.dart';

enum ActId { One, Two, Three, Four }

class ActStage extends StatelessWidget {
  final ActId actId;
  const ActStage({super.key, required this.actId});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final scenario = game.scenario;
    ActStageState stageState;
    ScenarioEvent event;
    String actTitle;
    String actKey;

    switch (actId) {
      case ActId.One:
        actTitle = 'Акт 1';
        actKey = 'act1';
        stageState = game.stageStates.act1;
        event = game.scenario.events[0];
        break;
      case ActId.Two:
        actTitle = 'Акт 2';
        actKey = 'act2';
        stageState = game.stageStates.act2;
        event = game.scenario.events[1];
        break;
      case ActId.Three:
        actTitle = 'Акт 3';
        actKey = 'act3';
        stageState = game.stageStates.act3;
        event = game.scenario.events[2];
        break;
      case ActId.Four:
        actTitle = 'Акт 4';
        actKey = 'act4';
        stageState = game.stageStates.act4;
        event = game.scenario.events[3];
        break;
      default:
        actTitle = 'Не верный акт';
        actKey = 'null';
        stageState = game.stageStates.act1;
        event = game.scenario.events[0];
    }

    return ScreenLayout(
      key: Key(actKey),
      bodyContent: ActStageBody(
        actTitle: actTitle,
        title: event.title,
        description: event.description,
        isCardsShowed: stageState.isCardsShowed,
        firstCard: event.facts[0],
        secondCard: event.facts[1],
        thirdCard: event.facts[2],
        isFirstCardShowed: stageState.isFirstCardShowed,
        isSecondCardShowed: stageState.isSecondCardShowed,
        isThirdCardShowed: stageState.isThirdCardShowed,
      ),
      leftTopContent: ExitButton(),
      rightBottomContent: !stageState.isCardsShowed ||
              stageState.isFirstCardShowed &&
                  stageState.isSecondCardShowed &&
                  stageState.isThirdCardShowed
          ? NextButton(
              onPressed: () {
                if (!stageState.isCardsShowed) {
                  gameState.updateGameState(GameStageStates.fromExisting(
                      game.stageStates,
                      ActStageState(
                          id: stageState.id,
                          isCardsShowed: true,
                          isFirstCardShowed: stageState.isFirstCardShowed,
                          isSecondCardShowed: stageState.isSecondCardShowed,
                          isThirdCardShowed: stageState.isThirdCardShowed),
                      actKey));
                  return;
                }

                if (actId == ActId.One) {
                  gameState.updateStage(GameStage.Act2);
                }
                if (actId == ActId.Two) {
                  gameState.updateStage(GameStage.Act3);
                }
                if (actId == ActId.Three) {
                  gameState.updateStage(GameStage.Act4);
                }
                if (actId == ActId.Four) {
                  gameState.updateStage(GameStage.Evidences);
                }
              },
            )
          : Container(),
        leftBottomContent: BackButton(onPressed: () {
            gameState.updateStage(GameStage.Defendant);
        },),
      rightTopContent: Text(
        scenario.description.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
