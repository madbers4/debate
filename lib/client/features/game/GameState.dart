import 'package:flutter/widgets.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/api/GameClient.dart';
import 'package:v1/client/features/game/GameRouter.dart';
import 'package:v1/common/features/game/Game.dart';
import 'package:provider/provider.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';

class GameState extends ChangeNotifier {
  Game? game;
  Game? previousGame;
  String? gameSubscriptionId;

  GameClient? _client;

  GameState();

  setClients(BuildContext context) {
    _client = Provider.of<GameClient>(context, listen: false);
    gameSubscriptionId = _client!.subGame(_onGame);
  }

  @override
  void dispose() {
    _client!.unsubscribe(gameSubscriptionId!);
    super.dispose();
  }

  updateGameState(GameStageStates updatedState) {
    _client!.updateGame(Game(
        id: game!.id,
        gameStage: game!.gameStage,
        scenario: game!.scenario,
        stageStates: updatedState));
  }

  updateGame(Game game) {
    _client!.updateGame(game);
  }

  updateStage(GameStage stage) {
    _client!.updateGame(Game(
        id: game!.id,
        gameStage: stage,
        scenario: game!.scenario,
        stageStates: game!.stageStates));
  }

  _onGame(Game g) {
    previousGame = game;
    game = g;

    _updateRoute();
    notifyListeners();
  }

  _updateRoute() {
    if (previousGame == null) {
      router.go('/game/right');
      return;
    }

    switch (game!.gameStage) {
      case GameStage.Title:
        if (previousGame?.gameStage == GameStage.Defendant) {
          gameRouter.go('/title/left');
        } else {
          gameRouter.go('/title/right');
        }
        break;
      case GameStage.Defendant:
        if (previousGame?.gameStage == GameStage.Act1) {
          gameRouter.go('/defendant/left');
        } else {
          gameRouter.go('/defendant/right');
        }
        break;
      case GameStage.Act1:
        if (previousGame?.gameStage == GameStage.Act2) {
          gameRouter.go('/act/1/left');
        } else {
          gameRouter.go('/act/1/right');
        }
        break;
      case GameStage.Act2:
        if (previousGame?.gameStage == GameStage.Act3) {
          gameRouter.go('/act/2/left');
        } else {
          gameRouter.go('/act/2/right');
        }
        break;
      case GameStage.Act3:
        if (previousGame?.gameStage == GameStage.Act4) {
          gameRouter.go('/act/3/left');
        } else {
          gameRouter.go('/act/3/right');
        }
        break;
      case GameStage.Act4:
        if (previousGame?.gameStage == GameStage.Evidences) {
          gameRouter.go('/act/4/left');
        } else {
          gameRouter.go('/act/4/right');
        }
        break;
      case GameStage.Evidences:
        if (previousGame?.gameStage == GameStage.Debates) {
          gameRouter.go('/evidences/left');
        } else {
          gameRouter.go('/evidences/right');
        }
        break;
      case GameStage.Debates:
        if (previousGame?.gameStage == GameStage.Judgement) {
          gameRouter.go('/debates/left');
        } else {
          gameRouter.go('/debates/right');
        }
        break;
      case GameStage.Judgement:
        if (previousGame?.gameStage == GameStage.Verdict) {
          gameRouter.go('/judgement/left');
        } else {
          gameRouter.go('/judgement/right');
        }
        break;
      case GameStage.Verdict:
        gameRouter.go('/verdict/right');
        break;
    }
  }
}
