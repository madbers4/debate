import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/defendant/DefendantStageBody.dart';
import 'package:v1/client/features/game/widgets/side-tile/SideTitle.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/buttons/back/BackButton.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DefendantStageState.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

class DefendantStage extends StatelessWidget {
  const DefendantStage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final stageState = game.stageStates.defendant;
    final scenario = game.scenario;
    final defendant = scenario.defendant;

    return ScreenLayout(
      background: scenario.defendant.background,
      bodyContent: DefendantStageBody(
        description: defendant.description,
        isCardsShowed: stageState.isCardsShowed,
        bornOrigin: defendant.bornOrigin,
        professionOrigin: defendant.professionOrigin,
        secretOrigin: defendant.secretOrigin,
      ),
      leftTopContent:
          roomsState.selectedRole is! Defendant ? ExitButton() : Container(),
      leftBottomContent: roomsState.selectedRole is Plaintiff
          ? BackButton2(
              onPressed: () {
                if (stageState.isCardsShowed) {
                  gameState.updateGameState(GameStageStates.fromExisting(
                      game.stageStates,
                      DefendantStageState(
                          id: stageState.id, isCardsShowed: false)));
                } else {
                  gameState.updateStage(GameStage.Title);
                }
              },
            )
          : Container(),
      rightBottomContent: roomsState.selectedRole is Plaintiff
          ? NextButton(
              onPressed: () {
                if (!stageState.isCardsShowed) {
                  gameState.updateGameState(GameStageStates.fromExisting(
                      game.stageStates,
                      DefendantStageState(
                          id: stageState.id, isCardsShowed: true)));
                } else {
                  gameState.updateStage(GameStage.Act1);
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
