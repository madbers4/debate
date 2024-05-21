import 'package:flutter/material.dart';
import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/game/GameEndpointApi.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';

class GameClient extends ChangeNotifier {
  SocketClient? socketClient;
  GameEndpointApi api = GameEndpointApi();

  GameClient();

  void setClient(SocketClient s) {
    socketClient = s;
    notifyListeners();
  }

  String subGame(void Function(Game game) callback) {
    return socketClient!.subscribe(api.game, callback);
  }

  unsubscribe(String id) {
    socketClient!.unsubscribe(id);
  }

  createGame(Game args) {
    socketClient!.send(api.create, args);
  }

  updateGame(Game args) {
    socketClient!.send(api.update, args);
  }
}
