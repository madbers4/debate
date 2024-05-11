import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStageBody.dart';
import 'package:v1/client/features/game/widgets/side-tile/SideTitle.dart';
import 'package:v1/client/features/menu/MenuLayout.dart';
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
    final defendant = scenario.defendant;

    return LeftSnappingSheet(
      child: BottomSnappingSheet(
        child: ScreenLayout(
          bodyContent: DebatesStageBody(),
          rightTopContent: SideTitle(
            title: scenario.description.title,
          ),
          leftTopContent: ExitButton(),
        ),
      ),
    );
  }
}


    // return Stack(
    //   children: [
    //     // Left Cards
    //     Container(),
    //     // Bottom Cards
    //     Container(),
    //     // Body
    //     // Act 1 Tile
    //     Container(),
    //     // Act 2 Tile
    //     Container(),
    //     // Act 3 Tile
    //     Container(),
    //     // Act 4 Tile
    //     Container(),
    //     // Center Slots
    //     // Left CardSlot
    //     Container(),
    //     // Right Card Slot
    //     Container(),
    //     // Apply
    //     Container(),
    //     // Reject
    //     Container(),
    //     // End
    //     Container(),
    //   ],
    // );