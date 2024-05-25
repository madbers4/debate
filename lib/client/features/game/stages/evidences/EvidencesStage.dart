import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/evidences/EvidencesStageBody.dart';
import 'package:v1/client/features/game/widgets/side-tile/SideTitle.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/common/features/game/GameStage.dart';

class EvidencesStage extends StatelessWidget {
  const EvidencesStage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.evidences;
    final scenario = game.scenario;
    final defendant = scenario.defendant;

    return ScreenLayout(
      bodyContent: EvidencesStageBody(
        evidences: scenario.evedences,
      ),
      leftTopContent: ExitButton(),
      rightBottomContent: NextButton(
        onPressed: () {
          gameState.updateStage(GameStage.Debates);
        },
      ),
      leftBottomContent: BackButton(
        onPressed: () {
          gameState.updateStage(GameStage.Act4);
        },
      ),
      rightTopContent: SideTitle(
        title: scenario.description.title,
      ),
    );
  }
}
