import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameRouter.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/defendant/DefendantStageBody.dart';
import 'package:v1/client/features/game/widgets/side-tile/SideTitle.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DefendantStageState.dart';

class DefendantStage extends StatelessWidget {
  const DefendantStage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.defendant;
    final scenario = game.scenario;
    final defendant = scenario.defendant;

    return ScreenLayout(
      bodyContent: DefendantStageBody(
        description: defendant.description,
        isCardsShowed: stageState.isCardsShowed,
        bornOrigin: defendant.bornOrigin,
        professionOrigin: defendant.professionOrigin,
        secretOrigin: defendant.secretOrigin,
      ),
      leftTopContent: ExitButton(),
      leftBottomContent: BackButton(
        onPressed: () {
          gameState.updateStage(GameStage.Title);
        },
      ),
      rightBottomContent: NextButton(
        onPressed: () {
          if (!stageState.isCardsShowed) {
            gameState.updateGameState(GameStageStates.fromExisting(
                game.stageStates,
                DefendantStageState(id: stageState.id, isCardsShowed: true)));
          } else {
            gameState.updateStage(GameStage.Act1);
          }
        },
      ),
      rightTopContent: SideTitle(
        title: scenario.description.title,
      ),
    );
  }
}
