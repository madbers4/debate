import 'package:v1/common/features/infrastructure/service/SocketService.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Observer.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/player/Player.dart';
import 'package:v1/common/features/player/Role.dart';
import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/room/JoinRoomArgs.dart';
import 'package:v1/common/features/room/RemoveRoomArgs.dart';
import 'package:v1/common/features/room/Room.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:v1/common/features/room/RoomsFailArgs.dart';
import 'package:v1/common/features/room/RoomsFailReason.dart';
import 'package:v1/common/utils/generateUID.dart';
import 'package:v1/server/features/autorization/AutorizationService.dart';
import 'package:v1/server/features/rooms/RoomsEndpoint.dart';

class RoomsService extends SocketService {
  Map<SocketClient, List<String>> subsIdsByClient = {};
  Map<SocketClient, RoomsEndpoint> endpointByClient = {};
  Map<SocketClient, Player> playerByClient = {};
  Map<SocketClient, String> roomIdByClient = {};
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
      _createRoom(args, client);
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

    subs.add(endpoint.subExitRooms((_) {
      _exitRooms(client, true);
    }));

    endpoint.sendRooms(rooms);
  }

  @override
  removeClient(SocketClient client) {
    final subs = subsIdsByClient[client]!;
    final endpoint = endpointByClient[client]!;

    for (final sub in subs) {
      endpoint.unsubscribe(sub);
    }

    endpointByClient.remove(client);

    _exitRooms(client, true);
  }

  void _createRoom(CreateRoomArgs args, SocketClient client) {
    if (!authService.isClientAutorized(client)) {
      return;
    }

    if (rooms.getAll().length > 10) {
      final endpoint = endpointByClient[client]!;
      endpoint.sendError(RoomsFailArgs(reason: RoomsFailReason.TooMuchRooms));
      return;
    }

    if (rooms.getAll().any((Room e) => e.name == args.name)) {
      final endpoint = endpointByClient[client]!;
      endpoint.sendError(RoomsFailArgs(
          reason: RoomsFailReason.TheRoomWithThisNameAlreadyExists));
      return;
    }

    final newRoom = Room(id: generateUID(), name: args.name);
    rooms.add(newRoom);
    _sendRoomsToClients();
  }

  void _removeRoom(RemoveRoomArgs args) {
    rooms.remove(args.roomId);
    _sendRoomsToClients();
  }

  void _joinRoom(JoinRoomArgs args, SocketClient client) {
    if (rooms.has(args.roomId) == false) {
      return;
    }

    if (roomIdByClient[client] != null) {
      _exitRooms(client, false);
    }

    Player? player;

    switch (args.role) {
      case PlayerRole.Observer:
        {
          player = Observer();
        }
      case PlayerRole.Defendant:
      case PlayerRole.Plaintiff:
        {
          if (!authService.isClientAutorized(client)) {
            break;
          }

          final userToken = authService.getToken(client);

          if (args.role == PlayerRole.Defendant) {
            player = Defendant(name: userToken.username);
          }

          if (args.role == PlayerRole.Plaintiff) {
            player = Plaintiff(name: userToken.username);
          }

          break;
        }
      default:
        break;
    }

    if (player == null) {
      return;
    }

    rooms.join(args.roomId, player);
    roomIdByClient[client] = args.roomId;
    playerByClient[client] = player;

    _sendRoomsToClients();

    final endpoint = endpointByClient[client]!;
    endpoint.sendSelectedRole(player);
    endpoint.sendSelectedRoom(rooms.get(args.roomId)!);
  }

  void _exitRooms(SocketClient client, bool needEmit) {
    final roomId = roomIdByClient[client];
    final player = playerByClient[client];

    roomIdByClient.remove(client);
    playerByClient.remove(client);

    if (roomId == null || player == null) {
      return;
    }

    if (rooms.has(roomId)) {
      rooms.exitRoom(roomId, player);

      if (needEmit == true) {
        _sendRoomsToClients();

        final endpoint = endpointByClient[client]!;
        endpoint.sendSelectedRoleRemove();
        endpoint.sendSelectedRoomRemove();
      }
    }
  }

  void _getRooms(SocketClient client) {
    final endpoint = endpointByClient[client]!;
    endpoint.sendRooms(rooms);
  }

  void _sendRoomsToClients() {
    for (final endpoint in endpointByClient.values) {
      endpoint.sendRooms(rooms);
    }
  }
}
