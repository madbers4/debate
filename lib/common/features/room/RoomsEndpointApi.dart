import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/infrastructure/endpoint/EndpointHandler.dart';
import 'package:v1/common/features/room/JoinRoomArgs.dart';
import 'package:v1/common/features/room/RemoveRoomArgs.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';

class RoomsEndpointApi {
  EndpointHandler<Rooms> roomsHandler =
      EndpointHandler(path: '/rooms', accesses: [], dtoFactory: Rooms.fromJson);

  EndpointHandler<Void> getStateHandler = EndpointHandler(
      path: '/rooms/get', accesses: [], dtoFactory: Void.fromJson);

  EndpointHandler<CreateRoomArgs> create = EndpointHandler(
      path: '/rooms/create', accesses: [], dtoFactory: CreateRoomArgs.fromJson);

  EndpointHandler<JoinRoomArgs> join = EndpointHandler(
      path: '/rooms/join', accesses: [], dtoFactory: JoinRoomArgs.fromJson);

  EndpointHandler<RemoveRoomArgs> remove = EndpointHandler(
      path: '/rooms/remove', accesses: [], dtoFactory: RemoveRoomArgs.fromJson);
}
