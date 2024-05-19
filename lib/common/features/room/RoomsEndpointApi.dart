import 'package:v1/common/features/player/Player.dart';
import 'package:v1/common/features/player/PlayerFactory.dart';
import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/infrastructure/endpoint/EndpointHandler.dart';
import 'package:v1/common/features/room/JoinRoomArgs.dart';
import 'package:v1/common/features/room/RemoveRoomArgs.dart';
import 'package:v1/common/features/room/Room.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';
import 'package:v1/common/features/room/RoomsFailArgs.dart';

class RoomsEndpointApi {
  EndpointHandler<Rooms> roomsHandler =
      EndpointHandler(path: '/rooms', accesses: [], dtoFactory: Rooms.fromJson);

  EndpointHandler<Room> selectedRoomHandler = EndpointHandler(
      path: '/rooms/selected-room', accesses: [], dtoFactory: Room.fromJson);

  EndpointHandler<Void> selectedRoomRemoveHandler = EndpointHandler(
      path: '/rooms/selected-room/remove',
      accesses: [],
      dtoFactory: Void.fromJson);

  EndpointHandler<Player> selectedRoleHandler = EndpointHandler(
      path: '/rooms/selected-role',
      accesses: [],
      dtoFactory: PlayerFactory.fromJson,
      customToDTOFactory: PlayerFactory.toJson);

  EndpointHandler<Void> selectedRoleRemoveHandler = EndpointHandler(
      path: '/rooms/selected-role/remove',
      accesses: [],
      dtoFactory: Void.fromJson);

  EndpointHandler<RoomsFailArgs> errorHandler = EndpointHandler(
      path: '/rooms/error', accesses: [], dtoFactory: RoomsFailArgs.fromJson);

  EndpointHandler<CreateRoomArgs> create = EndpointHandler(
      path: '/rooms/create', accesses: [], dtoFactory: CreateRoomArgs.fromJson);

  EndpointHandler<JoinRoomArgs> join = EndpointHandler(
      path: '/rooms/join', accesses: [], dtoFactory: JoinRoomArgs.fromJson);

  EndpointHandler<Void> exit = EndpointHandler(
      path: '/rooms/exit', accesses: [], dtoFactory: Void.fromJson);

  EndpointHandler<RemoveRoomArgs> remove = EndpointHandler(
      path: '/rooms/remove', accesses: [], dtoFactory: RemoveRoomArgs.fromJson);
}
