import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/room/JoinRoomArgs.dart';
import 'package:v1/common/features/room/RemoveRoomArgs.dart';
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

  unsubscribe(String id) {
    socketClient.unsubscribe(id);
  }

  getRooms() {
    print('get rooms');
    socketClient.send(api.getStateHandler, Void());
  }

  createRoom(CreateRoomArgs args) {
    socketClient.send(api.create, args);
  }

  joinRoom(JoinRoomArgs args) {
    socketClient.send(api.join, args);
  }

  removeRoom(RemoveRoomArgs args) {
    socketClient.send(api.remove, args);
  }
}
