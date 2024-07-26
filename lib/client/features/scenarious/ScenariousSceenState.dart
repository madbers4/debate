import 'package:flutter/material.dart';
import 'package:v1/client/api/GameClient.dart';
import 'package:v1/client/features/settings/SettingsState.dart';
import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/scenario/Scenario.dart';
import 'package:provider/provider.dart';
import 'package:v1/common/features/scenario/scenarios/scenarious.dart';
import 'package:v1/common/utils/generateUID.dart';

class ScenarionScreenState extends ChangeNotifier {
  String? selectedScenarioId;
  bool hasSelectAccess = true;
  final List<Scenario> scenarious_ = scenarious;
  late final GameClient _gameClient;
  late final SettingsState _settings;

  ScenarionScreenState(BuildContext context) {
    _gameClient = Provider.of<GameClient>(context, listen: false);
    _settings = Provider.of<SettingsState>(context, listen: false);
  }

  selectScenario(String? id) {
    selectedScenarioId = id;
    notifyListeners();
  }

  createGame() {
    if (selectedScenarioId == null) {
      return;
    }

    final selectedScenario =
        scenarious_.firstWhere((element) => element.id == selectedScenarioId)!;

    _gameClient.createGame(Game(
        id: generateUID(),
        gameStage: GameStage.Title,
        scenario: selectedScenario,
        stageStates: GameStageStates(),
        gameTime: Duration(seconds: _settings.settings?.timeousSec ?? 15000)
            .inMilliseconds));
  }
}
