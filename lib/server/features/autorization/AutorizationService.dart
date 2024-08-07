import 'dart:async';

import 'package:v1/common/features/autorization/AutorizationToken.dart';
import 'package:v1/common/features/autorization/SignInArgs.dart';
import 'package:v1/common/features/autorization/SignInFailArgs.dart';
import 'package:v1/common/features/autorization/SignInFailReason.dart';
import 'package:v1/common/features/autorization/SignInSuccessArgs.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';
import 'package:v1/common/features/infrastructure/service/SocketService.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/server/features/autorization/AutorizationEndpoint.dart';
import 'package:v1/server/features/autorization/JWTUtils.dart';
import 'package:v1/server/features/game/GameService.dart';
import 'package:v1/server/features/rooms/RoomsService.dart';

class AutorizationService extends SocketService {
  Map<SocketClient, List<String>> subsIdsByClient = {};
  Map<SocketClient, AutorizationEndpoint> endpointByClient = {};
  Map<SocketClient, AutorizationToken> autorizedTokensByClient = {};
  // TODO: Сделать роль в AuthToken
  List<SocketClient> observersSocketClients = [];

  AutorizationService({required super.serviceProvider});

  @override
  addClient(SocketClient client) {
    super.addClient(client);

    AutorizationEndpoint endpoint = AutorizationEndpoint(client);
    endpointByClient[client] = endpoint;

    List<String> subs = [];
    subsIdsByClient[client] = subs;

    subs.add(endpoint.subTokenSignInHandler((args) {
      _tokenSignIn(args, client);
    }));

    subs.add(endpoint.subSignIn((args) {
      _signIn(args, client);
    }));

    subs.add(endpoint.subObserverSignIn((_) {
      _obsSignIn(_, client);
    }));
  }

  @override
  removeClient(SocketClient client) {
    final subs = subsIdsByClient[client]!;
    final endpoint = endpointByClient[client]!;

    for (final sub in subs) {
      endpoint.unsubscribe(sub);
    }

    autorizedTokensByClient.remove(client);
    observersSocketClients.remove(client);
    endpointByClient.remove(client);
  }

  AutorizationToken getToken(SocketClient client) {
    final token = autorizedTokensByClient[client];

    if (token == null) {
      throw Exception('can`t find token');
    }

    return token;
  }

  bool isClientAutorized(SocketClient client) {
    return autorizedTokensByClient[client] != null;
  }

  bool isClientObserver(SocketClient client) {
    return observersSocketClients.contains(client);
  }

  void _tokenSignIn(AutorizationToken token, SocketClient client) {
    final endpoint = endpointByClient[client]!;

    if (JWTUtils.verifyAccessToken(accessToken: token.hash)) {
      autorizedTokensByClient[client] = token;

      Timer(Duration.zero, () {
        endpoint.sendSuccess(SignInSuccessArgs(isUserAutorized: true));
        addClientToServices(client);
      });
    } else {
      endpoint.sendFail(SignInFailArgs(reason: SignInFailReason.InvalidToken));
    }
  }

  void _obsSignIn(Void _, SocketClient client) {
    final endpoint = endpointByClient[client]!;

    observersSocketClients.add(client);

    Timer(Duration.zero, () {
      endpoint.sendSuccess(SignInSuccessArgs(isUserAutorized: false));
      addClientToServices(client);
    });
  }

  void _signIn(SignInArgs args, SocketClient client) {
    final endpoint = endpointByClient[client]!;

    if (args.username == 'test' && args.password == '123456') {
      final token = AutorizationToken(
          username: args.username,
          hash: JWTUtils.generateAccessToken(userId: args.username));
      autorizedTokensByClient[client] = token;

      Timer(Duration.zero, () {
        endpoint.sendSuccess(SignInSuccessArgs(isUserAutorized: true));
        endpoint.sendAuthToken(token);

        addClientToServices(client);
      });
    } else {
      endpoint.sendFail(
          SignInFailArgs(reason: SignInFailReason.WrongUserOrPassword));
    }
  }

  void addClientToServices(SocketClient client) {
    final roomsService = serviceProvider.get<RoomsService>();
    roomsService.addClient(client);
    final gameService = serviceProvider.get<GameService>();
    gameService.addClient(client);
  }
}
