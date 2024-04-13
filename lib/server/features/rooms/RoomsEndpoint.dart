import 'package:v1/common/features/infrastructure/dto/Void.dart';
import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/room/JoinRoomArgs.dart';
import 'package:v1/common/features/room/RemoveRoomArgs.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:v1/common/features/room/RoomsEndpointApi.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';

class RoomsEndpoint {
  SocketClient socketClient;
  RoomsEndpointApi api = RoomsEndpointApi();

  RoomsEndpoint(this.socketClient);

  unsubscribe(String id) {
    socketClient.unsubscribe(id);
  }

  String subGetRooms(void Function(Void _) callback) {
    return socketClient.subscribe(api.getStateHandler, callback);
  }

  String subCreateRoom(void Function(CreateRoomArgs args) callback) {
    return socketClient.subscribe(api.create, callback);
  }

  String subJoinRoom(void Function(JoinRoomArgs args) callback) {
    return socketClient.subscribe(api.join, callback);
  }
  
  String subRemoveRoom(void Function(RemoveRoomArgs args) callback) {
    return socketClient.subscribe(api.remove, callback);
  }

  void sendRooms(Rooms args) {
    socketClient.send(api.roomsHandler, args);
  }
}
