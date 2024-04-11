import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/room/Room.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:v1/common/features/room/RoomsEndpointApi.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';

class RoomsEndpoint {
  SocketClient socketClient;
  RoomsEndpointApi api = RoomsEndpointApi();

  Rooms testRooms = Rooms(id: '1', list: [
    Room(id: '1', name: 'Wuhahaha room'),
    Room(id: '2', name: 'Furina room'),
    Room(id: '3', name: 'Anton room'),
    Room(id: '4', name: 'Navia))00'),
  ]);

  RoomsEndpoint(this.socketClient) {
    socketClient.subscribe(api.getRoomsHandler, getRooms);
    socketClient.subscribe(api.createRoom, createRoom);
  }

  void getRooms(DTO _) {
    sendRooms();
  }

  void createRoom(CreateRoomArgs args) {
    testRooms = Rooms(
        id: 'null',
        list: [...testRooms.list, Room(id: 'null', name: args.name)]);

    sendRooms();
  }

  void sendRooms() {
    socketClient.send(api.roomsHandler, testRooms);
  }
}
