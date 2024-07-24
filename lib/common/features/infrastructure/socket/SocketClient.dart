import 'dart:convert';

import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/infrastructure/endpoint/EndpointHandler.dart';
import 'package:v1/common/features/infrastructure/socket/SocketDTO.dart';
import 'package:v1/common/utils/generateUID.dart';

class SocketClient {
  final id = generateUID();
  dynamic io;
  // TODO: type this from dynamic to Subscriber
  Map<dynamic, dynamic> _subscribers = {};

  SocketClient({required this.io}) {
    // print('CREATE SOCKET CLIENT');
    // print('UID', id);
    io.on('data', _onData);
  }

  void send<T extends DTO>(EndpointHandler<T> endpointHandler, T dto) {
    final bus = endpointHandler.customToDTOFactory != null
        ? SocketBus(
            endpointHandler.customToDTOFactory!(dto), endpointHandler.path)
        : SocketBus(dto.toJson(), endpointHandler.path);

    final encoded = utf8.encode(jsonEncode(bus.toJson()));
    // print(jsonEncode(bus.toJson()));
    io.emit('data', encoded);
  }

  String subscribe<T extends DTO>(
      EndpointHandler<T> endpointHandler, SubscribeCallback<T> callback) {
    final subscriber = Subscriber<T>(endpointHandler, callback);
    _subscribers[subscriber.id] = subscriber;
    return subscriber.id;
  }

  unsubscribe(String id) {
    _subscribers.remove(id);
  }

  unsubscribeAll() {
    _subscribers = {};
  }

  _onData(dynamic data) {
    final bus = SocketBus.fromJson(jsonDecode(utf8.decode(data.cast<int>())));
    print(_subscribers.values);

    for (final subscriber in _subscribers.values) {
      if (subscriber.endpointHandler.path == bus.path) {
        final newInstance = subscriber.endpointHandler.dtoFactory(bus.data);
        subscriber.callback(newInstance);
      }
    }
  }
}

class Subscriber<T extends DTO> {
  String id = generateUID();
  EndpointHandler<T> endpointHandler;
  SubscribeCallback<T> callback;

  Subscriber(this.endpointHandler, this.callback);
}

typedef SubscribeCallback<T extends DTO> = void Function(T dto);
