import 'package:flutter/widgets.dart';
import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/scenario/scenarios/mysteryOfTheHeavenLyre.dart';

class GameState extends ChangeNotifier {
  late final Game game = Game(
      id: '1',
      scenario: mysteryOfTheHeavenlyLyre,
      gameStage: GameStage.Title,
      stageStates: GameStageStates());

  GameState(BuildContext context) {}
}
