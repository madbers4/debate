import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/game/GameEndpointApi.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';

class GameEndpoint {
  SocketClient socketClient;
  GameEndpointApi api = GameEndpointApi();

  GameEndpoint(this.socketClient);

  unsubscribe(String id) {
    socketClient.unsubscribe(id);
  }

  String subCreateGame(void Function(Game args) callback) {
    return socketClient.subscribe(api.create, callback);
  }

  String subUpdateGame(void Function(Game args) callback) {
    return socketClient.subscribe(api.update, callback);
  }

  String subExit(void Function(Void args) callback) {
    return socketClient.subscribe(api.exit, callback);
  }

  void sendGame(Game args) {
    socketClient.send(api.game, args);
  }
}
