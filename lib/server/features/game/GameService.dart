import 'package:v1/common/features/autorization/AutorizationToken.dart';
import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';

import 'package:v1/common/features/infrastructure/service/SocketService.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/server/features/autorization/AutorizationService.dart';
import 'package:v1/server/features/game/GameEndpoint.dart';
import 'package:v1/server/features/rooms/RoomsService.dart';

class GameService extends SocketService {
  Map<SocketClient, List<String>> subsIdsByClient = {};
  Map<SocketClient, GameEndpoint> endpointByClient = {};
  Map<SocketClient, AutorizationToken> autorizedTokensByClient = {};
  late AutorizationService authService;
  Map<SocketClient, String> gameIdByClient = {};
  // Map<SocketClient, String> gameByRoom = {};
  Map<String, Game> gameById = {};

  GameService({required super.serviceProvider}) {
    authService = serviceProvider.get<AutorizationService>();
  }

  @override
  addClient(SocketClient client) {
    if (!authService.isClientAutorized(client) &&
        !authService.isClientObserver(client)) {
      return;
    }

    super.addClient(client);

    GameEndpoint endpoint = GameEndpoint(client);
    endpointByClient[client] = endpoint;

    List<String> subs = [];
    subsIdsByClient[client] = subs;

    subs.add(endpoint.subCreateGame((args) {
      _updateGame(args, client);
    }));

    subs.add(endpoint.subUpdateGame((args) {
      _updateGame(args, client);
    }));

    subs.add(endpoint.subExit((args) {
      _exitGame(args, client);
    }));
  }

  @override
  removeClient(SocketClient client) {
    final subs = subsIdsByClient[client];
    final endpoint = endpointByClient[client];

    if (subs == null || endpoint == null) {
      return;
    }

    for (final sub in subs) {
      endpoint.unsubscribe(sub);
    }

    autorizedTokensByClient.remove(client);
    endpointByClient.remove(client);
  }

  void _exitGame(Void game, SocketClient client) {
    if (!authService.isClientAutorized(client)) {
      return;
    }

    final roomsService = serviceProvider.get<RoomsService>();
    final roomId = roomsService.roomIdByClient[client]!;
    final room = roomsService.rooms.get(roomId)!;
    final plaintiff = room.plaintiff!;
    // TODO: REPLACE THIS
    final defendant = room.defendant!;
    final observers = room.observers;

    List<SocketClient> playersClients = roomsService.playerByClient.entries
        // .where((e) =>
        //     e.value == plaintiff ||
        //     // TODO: REPLACE THIS
        //     e.value == defendant ||
        //     observers.any((element) => element == e.value))
        .map((e) => e.key)
        .toList();

    for (final playerClient in playersClients) {
      final endpoint = endpointByClient[playerClient]!;
      endpoint.exit();
      gameIdByClient.removeWhere((key, value) => key == playerClient);
    }

    gameById = {};
  }

  void _updateGame(Game game, SocketClient client) {
    if (!authService.isClientAutorized(client)) {
      return;
    }

    gameById[game.id] = game;

    final roomsService = serviceProvider.get<RoomsService>();
    final roomId = roomsService.roomIdByClient[client]!;
    final room = roomsService.rooms.get(roomId)!;
    final plaintiff = room.plaintiff!;
    // TODO: REPLACE THIS
    final defendant = room.defendant!;
    final observers = room.observers;

    List<SocketClient> playersClients = roomsService.playerByClient.entries
        // .where((e) =>
        //     e.value == plaintiff ||
        //     // TODO: REPLACE THIS
        //     e.value == defendant ||
        //     observers.any((element) => element == e.value))
        .map((e) => e.key)
        .toList();

    for (final playerClient in playersClients) {
      final endpoint = endpointByClient[playerClient]!;
      endpoint.sendGame(game);

      gameIdByClient[playerClient] = game.id;
    }
  }
}
