import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/evidences/EvidencesStageBody.dart';
import 'package:v1/client/features/game/widgets/side-tile/SideTitle.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

class EvidencesStage extends StatelessWidget {
  const EvidencesStage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final stageState = game.stageStates.evidences;
    final scenario = game.scenario;
    final defendant = scenario.defendant;

    return ScreenLayout(
      bodyContent: EvidencesStageBody(
        evidences: scenario.evedences,
      ),
      leftTopContent:
          roomsState.selectedRole is! Defendant ? const ExitButton() : Container(),
      rightBottomContent: roomsState.selectedRole is Plaintiff
          ? NextButton(
              onPressed: () {
                gameState.updateStage(GameStage.Debates);
              },
            )
          : Container(),
      leftBottomContent: roomsState.selectedRole is Plaintiff
          ? BackButton(
              onPressed: () {
                gameState.updateStage(GameStage.Act4);
              },
            )
          : Container(),
      rightTopContent: SideTitle(
        title: scenario.description.title,
      ),
    );
  }
}
