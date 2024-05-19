import 'package:v1/common/features/autorization/AutorizationToken.dart';
import 'package:v1/common/features/game/Game.dart';

import 'package:v1/common/features/infrastructure/service/SocketService.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/server/features/autorization/AutorizationService.dart';
import 'package:v1/server/features/game/GameEndpoint.dart';

class GameService extends SocketService {
  Map<SocketClient, List<String>> subsIdsByClient = {};
  Map<SocketClient, GameEndpoint> endpointByClient = {};
  Map<SocketClient, AutorizationToken> autorizedTokensByClient = {};
  late AutorizationService authService;

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
      _createGame(args, client);
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

  void _createGame(Game game, SocketClient client) {
    print(game.toJson());
  }
}
