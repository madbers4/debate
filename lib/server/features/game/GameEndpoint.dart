import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/game/GameEndpointApi.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';

class RoomsEndpoint {
  SocketClient socketClient;
  GameEndpointApi api = GameEndpointApi();

  RoomsEndpoint(this.socketClient);

  unsubscribe(String id) {
    socketClient.unsubscribe(id);
  }

  String subCreateGame(void Function(Game args) callback) {
    return socketClient.subscribe(api.create, callback);
  }

  void sendState(Game args) {
    socketClient.send(api.game, args);
  }
}
