import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  final String actId;
  const ActStage({super.key, required this.actId});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final scenario = game.scenario;
    ActStageState stageState;
    ScenarioAct event;
    String actTitle = actId;
    String actKey;
    GameStage previousStage;

    switch (actId) {
      case actOneId:
        actKey = 'act1';
        stageState = game.stageStates.act1;
        event = game.scenario.acts[0];
        previousStage = GameStage.Defendant;
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
      rightBottomContent: roomsState.selectedRole is Plaintiff
          ? NextButton(onPressed: () {
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

              gameState.updateStage(GameStage.Evidences);
            })
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
