import 'package:flutter/material.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/common/features/player/Player.dart';
import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/room/JoinRoomArgs.dart';
import 'package:v1/common/features/room/RemoveRoomArgs.dart';
import 'package:v1/common/features/room/Room.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:v1/common/features/room/RoomsEndpointApi.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';
import 'package:v1/common/features/room/RoomsFailArgs.dart';

class RoomsClient extends ChangeNotifier {
  SocketClient? socketClient;
  RoomsEndpointApi api = RoomsEndpointApi();

  RoomsClient();

  void setClient(SocketClient s) {
    socketClient = s;
    notifyListeners();
  }

  String subRooms(void Function(Rooms rooms) callback) {
    return socketClient!.subscribe(api.roomsHandler, callback);
  }

  String subSelectedRole(void Function(Player role) callback) {
    return socketClient!.subscribe(api.selectedRoleHandler, callback);
  }

  String subSelectedRoom(void Function(Room role) callback) {
    return socketClient!.subscribe(api.selectedRoomHandler, callback);
  }

  String subSelectedRoleRemove(void Function(Void _) callback) {
    return socketClient!.subscribe(api.selectedRoleRemoveHandler, callback);
  }

  String subSelectedRoomRemove(void Function(Void _) callback) {
    return socketClient!.subscribe(api.selectedRoleRemoveHandler, callback);
  }

  String subError(void Function(RoomsFailArgs rooms) callback) {
    return socketClient!.subscribe(api.errorHandler, callback);
  }

  unsubscribe(String id) {
    socketClient!.unsubscribe(id);
  }

  createRoom(CreateRoomArgs args) {
    socketClient!.send(api.create, args);
  }

  joinRoom(JoinRoomArgs args) {
    socketClient!.send(api.join, args);
  }

  exitFromRooms() {
    socketClient!.send(api.exit, Void());
  }

  removeRoom(RemoveRoomArgs args) {
    socketClient!.send(api.remove, args);
  }
}
