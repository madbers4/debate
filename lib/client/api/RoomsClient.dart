import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:v1/common/features/room/RoomsEndpointApi.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';

class RoomsClient {
  SocketClient socketClient;
  RoomsEndpointApi api = RoomsEndpointApi();

  RoomsClient(this.socketClient);

  String subRooms(void Function(Rooms rooms) callback) {
    return socketClient.subscribe(api.roomsHandler, callback);
  }

  unsubRooms(String id) {
    socketClient.unsubscribe(id);
  }

  getRooms() {
    socketClient.send(api.getRoomsHandler, Void());
  }

  createRoom(CreateRoomArgs args) {
    socketClient.send(api.createRoom, args);
  }
}
