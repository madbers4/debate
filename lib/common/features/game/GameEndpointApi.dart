import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/infrastructure/endpoint/EndpointHandler.dart';

class GameEndpointApi {
  EndpointHandler<Game> game =
      EndpointHandler(path: '/game', accesses: [], dtoFactory: Game.fromJson);

  EndpointHandler<Game> create = EndpointHandler(
      path: '/game/create', accesses: [], dtoFactory: Game.fromJson);

  EndpointHandler<Game> update = EndpointHandler(
      path: '/game/update', accesses: [], dtoFactory: Game.fromJson);
}
