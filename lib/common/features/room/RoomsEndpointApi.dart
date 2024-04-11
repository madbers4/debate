import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/infrastructure/endpoint/EndpointHandler.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';

class RoomsEndpointApi {
  EndpointHandler<Rooms> roomsHandler =
      EndpointHandler(path: '/rooms', accesses: [], dtoFactory: Rooms.fromJson);

  EndpointHandler<Void> getRoomsHandler = EndpointHandler(
      path: '/rooms/get', accesses: [], dtoFactory: Void.fromJson);

  EndpointHandler<CreateRoomArgs> createRoom = EndpointHandler(
      path: '/rooms/create', accesses: [], dtoFactory: CreateRoomArgs.fromJson);
}
