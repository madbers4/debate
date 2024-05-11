import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStageBody.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStageBottomContent.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStageLeftContent.dart';
import 'package:v1/client/features/game/widgets/side-tile/SideTitle.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/BottomSnappingSheet.dart';
import 'package:v1/client/widgets/LeftSnappingSheet.dart';

class DebatesStage extends StatelessWidget {
  const DebatesStage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game;
    final stageState = game.stageStates.defendant;
    final scenario = game.scenario;

    return LeftSnappingSheet(
      sheetContent: const DebatesStageLeftContent(),
      child: BottomSnappingSheet(
        sheetContent: const DebatesStageBottomContent(),
        child: ScreenLayout(
          bodyContent: const DebatesStageBody(),
          rightTopContent: SideTitle(
            title: scenario.description.title,
          ),
          leftTopContent: const ExitButton(),
        ),
      ),
    );
  }
}
