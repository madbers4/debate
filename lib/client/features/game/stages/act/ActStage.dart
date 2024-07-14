import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/act-tile/ActTileV2.dart';
import 'package:v1/client/features/game/widgets/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/act/ActStageBody.dart';
import 'package:v1/client/features/game/widgets/side-tile/SideTitle.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/buttons/back/BackButton.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/ActStageState.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';
import 'package:v1/common/features/scenario/ScenarioActId.dart';

class ActStage extends StatelessWidget {
  final ActId actId;
  const ActStage({super.key, required this.actId});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final scenario = game.scenario;
    ActStageState stageState;
    ScenarioAct event;
    String actTitle = getActTitleByActId(actId);
    String actKey;
    GameStage previousStage;

    switch (actId) {
      case ActId.One:
        actKey = 'act1';
        stageState = game.stageStates.act1;
        event = game.scenario.acts[0];
        previousStage = GameStage.Defendant;
        break;
      case ActId.Two:
        actKey = 'act2';
        stageState = game.stageStates.act2;
        event = game.scenario.acts[1];
        previousStage = GameStage.Act1;
        break;
      case ActId.Three:
        actKey = 'act3';
        stageState = game.stageStates.act3;
        event = game.scenario.acts[2];
        previousStage = GameStage.Act2;
        break;
      case ActId.Four:
        actKey = 'act4';
        stageState = game.stageStates.act4;
        event = game.scenario.acts[3];
        previousStage = GameStage.Act3;
        break;
      default:
        actKey = 'null';
        stageState = game.stageStates.act1;
        event = game.scenario.acts[0];
        previousStage = GameStage.Defendant;
    }

    return ScreenLayout(
      key: Key(actKey),
      bodyContent: ActStageBody(
        actKey: actKey,
        actTitle: actTitle,
        event: event,
        stageState: stageState,
      ),
      leftTopContent:
          roomsState.selectedRole is! Defendant ? ExitButton() : Container(),
      rightBottomContent: roomsState.selectedRole is Plaintiff &&
              (!stageState.isCardsShowed ||
                  stageState.isFirstCardShowed &&
                      stageState.isSecondCardShowed &&
                      stageState.isThirdCardShowed)
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
      leftBottomContent: roomsState.selectedRole is Plaintiff
          ? BackButton2(
              onPressed: () {
                if (stageState.isCardsShowed) {
                  gameState.updateGameState(GameStageStates.fromExisting(
                      game.stageStates,
                      ActStageState(
                          id: stageState.id,
                          isCardsShowed: false,
                          isFirstCardShowed: stageState.isFirstCardShowed,
                          isSecondCardShowed: stageState.isSecondCardShowed,
                          isThirdCardShowed: stageState.isThirdCardShowed),
                      actKey));
                } else {
                  gameState.updateStage(previousStage);
                }
              },
            )
          : Container(),
      rightTopContent: SideTitle(
        title: scenario.description.title,
      ),
    );
  }
}
