import 'package:flutter/widgets.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/api/GameClient.dart';
import 'package:v1/client/features/game/GameRouter.dart';
import 'package:v1/common/features/game/Game.dart';
import 'package:provider/provider.dart';
import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';

class GameState extends ChangeNotifier {
  Game? game;
  Game? previousGame;
  String? gameSubscriptionId;
  String? exSubscriptionId;
  Duration gameTime = const Duration(minutes: 3);

  GameClient? _client;

  GameState();

  setClients(BuildContext context) {
    _client = Provider.of<GameClient>(context, listen: false);
    gameSubscriptionId = _client!.subGame(_onGame);
    exSubscriptionId = _client!.subExit(_onExit);
  }

  @override
  void dispose() {
    _client!.unsubscribe(gameSubscriptionId!);
    _client!.unsubscribe(exSubscriptionId!);
    super.dispose();
  }

  updateGameState(GameStageStates updatedState) {
    _client!.updateGame(Game(
        id: game!.id,
        gameStage: game!.gameStage,
        scenario: game!.scenario,
        stageStates: updatedState,
        gameTime: gameTime.inMilliseconds));
  }

  updateGame(Game game) {
    _client!.updateGame(game);
  }

  updateStage(GameStage stage) {
    _client!.updateGame(Game(
        id: game!.id,
        gameStage: stage,
        scenario: game!.scenario,
        stageStates: game!.stageStates,
        gameTime: gameTime.inMilliseconds));
  }

  exit() {
    _client!.exit();
  }

  _onGame(Game g) {
    if (g.id != game?.id) {
      game = null;
      previousGame = null;
    }

    if (game?.gameStage != GameStage.Title) {
      previousGame = game;
    }

    if (game == null) {
      previousGame = null;
    }

    game = g;
    gameTime = Duration(milliseconds: g.gameTime);

    _updateRoute();
    notifyListeners();
  }

  _onExit(Void _) {
    game = null;
    previousGame = null;
    router.go('/scenarious/right');
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
        if (previousGame?.gameStage == GameStage.Debates) {
          gameRouter.go('/act/1/left');
        } else {
          gameRouter.go('/act/1/right');
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
