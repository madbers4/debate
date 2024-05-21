import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameRouter.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/act/ActStageBody.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/common/features/game/GameStage.dart';
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

    switch (actId) {
      case ActId.One:
        stageState = game.stageStates.act1;
        event = game.scenario.events[0];
        break;
      case ActId.Two:
        stageState = game.stageStates.act2;
        event = game.scenario.events[1];
        break;
      case ActId.Three:
        stageState = game.stageStates.act3;
        event = game.scenario.events[2];
        break;
      case ActId.Four:
        stageState = game.stageStates.act4;
        event = game.scenario.events[3];
        break;
      default:
        stageState = game.stageStates.act1;
        event = game.scenario.events[0];
    }

    return ScreenLayout(
      bodyContent: ActStageBody(
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
      rightBottomContent: NextButton(
        onPressed: () {
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
      ),
      rightTopContent: Text(
        scenario.description.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
