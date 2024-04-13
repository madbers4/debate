import 'package:v1/common/features/infrastructure/service/SocketService.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/room/JoinRoomArgs.dart';
import 'package:v1/common/features/room/RemoveRoomArgs.dart';
import 'package:v1/common/features/room/Room.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:v1/common/utils/generateUID.dart';
import 'package:v1/server/features/autorization/AutorizationService.dart';
import 'package:v1/server/features/rooms/RoomsEndpoint.dart';

class RoomsService extends SocketService {
  Map<SocketClient, List<String>> subsIdsByClient = {};
  Map<SocketClient, RoomsEndpoint> endpointByClient = {};
  late AutorizationService authService;

  Rooms rooms = Rooms(id: '1', list: [
    Room(id: '1', name: 'Wuhahaha room'),
  ]);

  RoomsService({required super.serviceProvider}) {
    authService = serviceProvider.get<AutorizationService>();
  }

  @override
  addClient(SocketClient client) {
    super.addClient(client);

    RoomsEndpoint endpoint = RoomsEndpoint(client);
    endpointByClient[client] = endpoint;

    List<String> subs = [];
    subsIdsByClient[client] = subs;

    subs.add(endpoint.subCreateRoom((args) {
      _createRoom(args);
    }));

    subs.add(endpoint.subRemoveRoom((args) {
      _removeRoom(args);
    }));

    subs.add(endpoint.subJoinRoom((args) {
      _joinRoom(args, client);
    }));

    subs.add(endpoint.subGetRooms((_) {
      _getRooms(client);
    }));
  }

  @override
  removeClient(SocketClient client) {
    final subs = subsIdsByClient[client]!;
    final endpoint = endpointByClient[client]!;

    for (final sub in subs) {
      endpoint.unsubscribe(sub);
    }

    endpointByClient.remove(client);
  }

  void _createRoom(CreateRoomArgs args) {
    final newRoom = Room(id: generateUID(), name: args.name);
    rooms.add(newRoom);
    _sendRoomsToClients();
  }

  void _removeRoom(RemoveRoomArgs args) {
    rooms.remove(args.roomId);
    _sendRoomsToClients();
  }

  void _joinRoom(JoinRoomArgs args, SocketClient client) {
    if (!authService.isClientAutorized(client)) {
      return;
    }

    final userToken = authService.getToken(client);
    rooms.join(args.roomId, userToken.username, args.role);

    _sendRoomsToClients();
  }

  void _getRooms(SocketClient client) {
    if (!authService.isClientAutorized(client)) {
      return;
    }

    final endpoint = endpointByClient[client]!;
    endpoint.sendRooms(rooms);
  }

  void _sendRoomsToClients() {
    for (final endpoint in endpointByClient.values) {
      endpoint.sendRooms(rooms);
    }
  }
}
