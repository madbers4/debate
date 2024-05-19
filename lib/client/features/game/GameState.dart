import 'package:flutter/widgets.dart';
import 'package:v1/client/api/GameClient.dart';
import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/scenario/scenarios/mysteryOfTheHeavenLyre/mysteryOfTheHeavenLyre.dart';
import 'package:provider/provider.dart';

class GameState extends ChangeNotifier {
  late final Game game = Game(
      id: '1',
      scenario: mysteryOfTheHeavenlyLyre,
      gameStage: GameStage.Title,
      stageStates: GameStageStates());

  GameClient? _client;

  GameState(BuildContext context);

  setClients(BuildContext context) {
    _client = Provider.of<GameClient>(context, listen: false);
  }
}
