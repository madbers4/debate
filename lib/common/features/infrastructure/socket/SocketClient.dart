import 'dart:convert';
import 'dart:math';

import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/infrastructure/endpoint/EndpointHandler.dart';
import 'package:v1/common/features/infrastructure/socket/SocketDTO.dart';
import 'package:v1/common/utils/generateUID.dart';

class SocketClient {
  dynamic io;
  // TODO: type this from dynamic to Subscriber
  final Map<String, dynamic> _subscribers = {};

  SocketClient({required this.io}) {
    io.on('data', _onData);
  }

  void send<T extends DTO>(EndpointHandler<T> endpointHandler, T dto) {
    final bus = SocketBus(dto.toJson(), endpointHandler.path);
    io.emit('data', jsonEncode(bus.toJson()));
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

  _onData(dynamic data) {
    final bus = SocketBus.fromJson(jsonDecode(data));

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
