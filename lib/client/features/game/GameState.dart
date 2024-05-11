import 'package:flutter/widgets.dart';
import 'package:v1/common/features/games/Game.dart';
import 'package:v1/common/features/games/GameStage.dart';
import 'package:v1/common/features/games/GameStageStates.dart';
import 'package:v1/common/features/scenario/scenarios/mysteryOfTheHeavenLyre.dart';

class GameState extends ChangeNotifier {
  late final Game game = Game(
      id: '1',
      scenario: mysteryOfTheHeavenlyLyre,
      gameStage: GameStage.Title,
      stageStates: GameStageStates());

  GameState(BuildContext context) {}

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
