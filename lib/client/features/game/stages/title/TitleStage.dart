import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/title/TitleStageBody.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/TitleStageState.dart';

class TitleStage extends StatelessWidget {
  const TitleStage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.title;
    final scenario = game.scenario;
    final description = scenario.description;

    return ScreenLayout(
      bodyContent: TitleStageBody(
        title: description.title,
        description: description.description,
        isDescriptionShowed: stageState.isDescriptionShowed,
      ),
      leftTopContent: ExitButton(),
      rightBottomContent: NextButton(
        onPressed: () {
          if (stageState.isDescriptionShowed == false) {
            gameState.updateGameState(GameStageStates.fromExisting(
                game.stageStates,
                TitleStageState(id: stageState.id, isDescriptionShowed: true)));
          } else {
            gameState.updateStage(GameStage.Defendant);
          }
        },
      ),
    );
  }
}
