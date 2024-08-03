import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStageBody.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/debates/bottom-content/DebatesStageBottomContent.dart';
import 'package:v1/client/features/game/stages/debates/defendant-description/DebatesStageDefendantDescriptionButton.dart';
import 'package:v1/client/features/game/stages/debates/game-description/DebatesStageGameDescriptionButton.dart';
import 'package:v1/client/features/game/stages/debates/left-content/DebatesStageLeftContent.dart';
import 'package:v1/client/features/game/stages/debates/overlays/DebatesStagePauseOverlay.dart';
import 'package:v1/client/features/game/stages/debates/overlays/DebatesStageTimeoutOverlay.dart';
import 'package:v1/client/features/game/stages/debates/overlays/matcing-confirmed/DebatesStageConfirmedOverlay.dart';
import 'package:v1/client/features/game/stages/debates/overlays/DebatesStageDenialNotConfirmedOverlay.dart';
import 'package:v1/client/features/game/stages/debates/overlays/DebatesStageMatchingOverlay.dart';
import 'package:v1/client/features/game/stages/debates/timer/DebatesStageTimer.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
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
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GameDescription(child: 'Оставшееся время:  '),
                    DebatesStageTimer()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
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
            OverlayIds.Pause: const DebatesStagePauseOverlay(),
            OverlayIds.Timeout: const DebatesStageTimeoutOverlay(),
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
  static String Pause = '3';
  static String Timeout = '4';
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

  if (stageState.inPauseOvrl == true) {
    return OverlayIds.Pause;
  }

  if (stageState.isDebatesTimeout == true) {
    // return OverlayIds.Timeout;
  }

  return null;
}
