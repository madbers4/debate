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
    if (!authService.isClientAutorized(client) &&
        !authService.isClientObserver(client)) {
      print('return');
      return;
    }

    print('add client');

    super.addClient(client);

    RoomsEndpoint endpoint = RoomsEndpoint(client);
    endpointByClient[client] = endpoint;

    List<String> subs = [];
    subsIdsByClient[client] = subs;

    subs.add(endpoint.subCreateRoom((args) {
      _createRoom(args, client);
    }));

    subs.add(endpoint.subRemoveRoom((args) {
      _removeRoom(args, client);
    }));

    subs.add(endpoint.subJoinRoom((args) {
      _joinRoom(args, client);
    }));

    subs.add(endpoint.subExitRooms((_) {
      _exitRooms(client, true);
    }));

    _exitRooms(client, true);
    endpoint.sendRooms(rooms);
  }

  @override
  removeClient(SocketClient client) {
    final subs = subsIdsByClient[client];
    final endpoint = endpointByClient[client];

    if (subs == null || endpoint == null) {
      return;
    }

    _exitRooms(client, true);

    for (final sub in subs) {
      endpoint.unsubscribe(sub);
    }

    endpointByClient.remove(client);
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

  void _removeRoom(RemoveRoomArgs args, SocketClient client) {
    if (!authService.isClientAutorized(client)) {
      return;
    }

    if (rooms.has(args.roomId) == false) {
      return;
    }

    List<SocketClient> roomClients = roomIdByClient.entries
        .where((e) => e.value == args.roomId)
        .map((e) => e.key)
        .toList();

    for (final roomClient in roomClients) {
      _exitRooms(roomClient, false);
    }

    rooms.remove(args.roomId);
    _sendRoomsToClients();

    for (final roomClient in roomClients) {
      final endpoint = endpointByClient[roomClient]!;
      endpoint.sendSelectedRoleRemove();
      endpoint.sendSelectedRoomRemove();
    }
  }

  void _joinRoom(JoinRoomArgs args, SocketClient client) {
    if (rooms.has(args.roomId) == false) {
      return;
    }

    if (roomIdByClient[client] != null) {
      _exitRooms(client, false);
    }

    Player? player;
    final room = rooms.get(args.roomId)!;
    final endpoint = endpointByClient[client]!;

    switch (args.role) {
      case PlayerRole.Observer:
        {
          if (room.observers.length > 100) {
            endpoint.sendError(
                RoomsFailArgs(reason: RoomsFailReason.TooMuchObservers));
            break;
          }
          player = Observer();
        }
      case PlayerRole.Defendant:
      case PlayerRole.Plaintiff:
        {
          if (!authService.isClientAutorized(client)) {
            endpoint.sendError(RoomsFailArgs(reason: RoomsFailReason.Unknown));
            break;
          }

          final userToken = authService.getToken(client);

          if (args.role == PlayerRole.Defendant) {
            if (room.defendant != null) {
              endpoint.sendError(RoomsFailArgs(
                  reason: RoomsFailReason.TheDefenderAlreadyExists));
              break;
            }

            player = Defendant(name: userToken.username);
          }

          if (args.role == PlayerRole.Plaintiff) {
            if (room.plaintiff != null) {
              endpoint.sendError(RoomsFailArgs(
                  reason: RoomsFailReason.ThePlainriffAlreadyExists));
              break;
            }

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

    List<SocketClient> roomClients = roomIdByClient.entries
        .where((e) => e.value == args.roomId)
        .map((e) => e.key)
        .toList();

    for (final roomClient in roomClients) {
      final roomClientEndpoint = endpointByClient[roomClient]!;
      roomClientEndpoint.sendSelectedRoom(rooms.get(args.roomId)!);
    }

    endpoint.sendSelectedRole(player);
    _sendRoomsToClients();
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

        List<SocketClient> roomClients = roomIdByClient.entries
            .where((e) => e.value == roomId && e.key != client)
            .map((e) => e.key)
            .toList();

        for (final roomClient in roomClients) {
          final roomClientEndpoint = endpointByClient[roomClient]!;
          roomClientEndpoint.sendSelectedRoom(rooms.get(roomId)!);
        }
      }
    }
  }

  void _sendRoomsToClients() {
    for (final endpoint in endpointByClient.values) {
      endpoint.sendRooms(rooms);
    }
  }
}
