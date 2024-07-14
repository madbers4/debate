import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/features/game/GameState.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/act-tile/ActTileV2.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/widgets/buttons/back/BackButton.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';

import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';

import 'package:v1/common/features/scenario/ScenarioActId.dart';

class DebatesStageActTile extends StatelessWidget {
  const DebatesStageActTile({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final game = gameState.game!;
    final stageState = game.stageStates.debates;
    final scenario = game.scenario;

    final List<String> hiddenActIds =
        stageState.selectedEventId != null ? [stageState.selectedEventId!] : [];

    return Container(
        child: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          width: 550,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton2(
                  isHidden: getPrevActId(stageState.showedActId) == null,
                  onPressed: () {
                    gameState.updateGameState(GameStageStates.fromExisting(
                        game.stageStates,
                        DebatesStageState.fromJson({
                          ...stageState.toJson(),
                          'showedActId':
                              getPrevActId(stageState.showedActId).toString()
                        })));
                  }),
              GameTitle(child: getActTitleByActId(stageState.showedActId)),
              NextButton(
                  isHidden: getNextActId(stageState.showedActId) == null,
                  onPressed: () {
                    gameState.updateGameState(GameStageStates.fromExisting(
                        game.stageStates,
                        DebatesStageState.fromJson({
                          ...stageState.toJson(),
                          'showedActId':
                              getNextActId(stageState.showedActId).toString()
                        })));
                  })
            ],
          ),
        ),
        ActTileV2(
          actId: ActId.One,
          event: scenario.acts[0],
          isShowed: stageState.showedActId == ActId.One,
          hiddenIds: hiddenActIds,
        ),
        ActTileV2(
          actId: ActId.Two,
          event: scenario.acts[1],
          isShowed: stageState.showedActId == ActId.Two,
          hiddenIds: hiddenActIds,
        ),
        ActTileV2(
          actId: ActId.Three,
          event: scenario.acts[2],
          isShowed: stageState.showedActId == ActId.Three,
          hiddenIds: hiddenActIds,
        ),
        ActTileV2(
          actId: ActId.Four,
          event: scenario.acts[3],
          isShowed: stageState.showedActId == ActId.Four,
          hiddenIds: hiddenActIds,
        ),
      ],
    ));
  }
}
