import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/act-tile/ActTile.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/widgets/buttons/back/BackButton.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';

import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

import 'package:v1/common/features/scenario/ScenarioActId.dart';

class DebatesStageActTile extends StatelessWidget {
  const DebatesStageActTile({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;
    final roomsState = context.watch<RoomsState>();

    final List<String> hiddenActIds =
        stageState.selectedEventId != null ? [stageState.selectedEventId!] : [];

    final currentActIndex =
        game.scenario.acts.indexWhere((e) => e.id == stageState.showedActId);
    final isLastAct = currentActIndex == game.scenario.acts.length - 1;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          width: 550,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton2(
                  isHidden: roomsState.selectedRole is! Plaintiff ||
                      getPrevActId(stageState.showedActId) == null,
                  onPressed: () {
                    gameState.updateGameState(GameStageStates.fromExisting(
                        game.stageStates,
                        DebatesStageState.fromJson({
                          ...stageState.toJson(),
                          'showedActId': getPrevActId(stageState.showedActId)
                        })));
                  }),
              GameTitle(child: stageState.showedActId),
              NextButton(
                  isHidden: roomsState.selectedRole is! Plaintiff ||
                      getNextActId(stageState.showedActId) == null ||
                      isLastAct,
                  onPressed: () {
                    gameState.updateGameState(GameStageStates.fromExisting(
                        game.stageStates,
                        DebatesStageState.fromJson({
                          ...stageState.toJson(),
                          'showedActId': getNextActId(stageState.showedActId)
                        })));
                  })
            ],
          ),
        ),
        ...scenario.acts.map((act) => ActTile(
              event: act,
              isShowed: stageState.showedActId == act.id,
              hiddenIds: hiddenActIds,
            ))
      ],
    );
  }
}
