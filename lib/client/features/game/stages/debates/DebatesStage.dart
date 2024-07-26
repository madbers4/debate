import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStageBody.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/debates/bottom-content/DebatesStageBottomContent.dart';
import 'package:v1/client/features/game/stages/debates/defendant-description/DebatesStageDefendantDescriptionButton.dart';
import 'package:v1/client/features/game/stages/debates/game-description/DebatesStageGameDescriptionButton.dart';
import 'package:v1/client/features/game/stages/debates/left-content/DebatesStageLeftContent.dart';
import 'package:v1/client/features/game/stages/debates/overlays/matcing-confirmed/DebatesStageConfirmedOverlay.dart';
import 'package:v1/client/features/game/stages/debates/overlays/DebatesStageDenialNotConfirmedOverlay.dart';
import 'package:v1/client/features/game/stages/debates/overlays/DebatesStageMatchingOverlay.dart';
import 'package:v1/client/features/game/widgets/side-tile/SideTitle.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/BottomSnappingSheet.dart';
import 'package:v1/client/widgets/LeftSnappingSheet.dart';

class DebatesStage extends StatelessWidget {
  const DebatesStage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();
    final game = gameState.game!;
    final stageState = game.stageStates.defendant;
    final scenario = game.scenario;

    String? activeOverlayId = getActiveOverlayId(gameState);

    return LeftSnappingSheet(
      isHidden: activeOverlayId != null,
      sheetContent: const DebatesStageLeftContent(),
      child: BottomSnappingSheet(
        sheetContent: const DebatesStageBottomContent(),
        isHidden: activeOverlayId != null,
        child: ScreenLayout(
          bodyContent: const DebatesStageBody(),
          rightBottomContent: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    SideTitle(
                      title: scenario.description.title,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    DebatesStageDefendantDescriptionButton(),
                    SizedBox(
                      width: 10,
                    ),
                    DebatesStageGameDescriptionButton()
                  ],
                ),
              ],
            ),
          ),
          activeOverlayId: activeOverlayId,
          overlays: {
            OverlayIds.Matching: const DebatesStageMatchingOverlay(),
            OverlayIds.DenialNotConfirmed:
                const DebatesStageDenialNotConfirmedOverlay(),
            OverlayIds.DenialConfirmed: const DebatesStageConfirmedOverlay(),
          },
        ),
      ),
    );
  }
}

abstract class OverlayIds {
  static String Matching = '0';
  static String DenialNotConfirmed = '1';
  static String DenialConfirmed = '2';
}

String? getActiveOverlayId(GameState gameState) {
  final game = gameState.game!;
  final stageState = game.stageStates.debates;
  final scenario = game.scenario;

  if (stageState.inDenial == true) {
    return OverlayIds.Matching;
  }

  if (stageState.inDenialNotConfirmed == true) {
    return OverlayIds.DenialNotConfirmed;
  }

  if (stageState.inDenialConfirmed == true) {
    return OverlayIds.DenialConfirmed;
  }

  return null;
}
