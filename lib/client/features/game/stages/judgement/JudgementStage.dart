import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/exit-dialog/ExitButton.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:v1/client/features/game/stages/judgement/JudgementStageBody.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/JudgementStageState.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

class JudgementStage extends StatelessWidget {
  const JudgementStage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final roomsState = context.watch<RoomsState>();

    final game = gameState.game!;
    final stageState = game.stageStates.title;
    final scenario = game.scenario;
    final description = scenario.description;

    return ScreenLayout(
      bodyContent: const JudgementStageBody(),
      background: 'test-blue-background.png',
      leftTopContent:
          roomsState.selectedRole is! Defendant ? ExitButton() : Container(),
      rightBottomContent: roomsState.selectedRole is Plaintiff
          ? TextButton(
              child: const Text('Признать виновным'),
              onPressed: () {
                gameState.updateGame(Game(
                    id: game!.id,
                    gameStage: GameStage.Verdict,
                    scenario: game!.scenario,
                    gameTime: game.gameTime,
                    stageStates: GameStageStates.fromExisting(
                      gameState.game!.stageStates,
                      JudgementStageState(id: stageState.id, foundGuilty: true),
                    )));
              },
            )
          : Container(),
      leftBottomContent: roomsState.selectedRole is Plaintiff
          ? TextButton(
              child: const Text('Признать невиновным'),
              onPressed: () {
                gameState.updateGame(Game(
                    id: game!.id,
                    gameStage: GameStage.Verdict,
                    scenario: game!.scenario,
                    gameTime: game.gameTime,
                    stageStates: GameStageStates.fromExisting(
                      gameState.game!.stageStates,
                      JudgementStageState(
                          id: stageState.id, foundGuilty: false),
                    )));
              },
            )
          : Container(),
    );
  }
}
