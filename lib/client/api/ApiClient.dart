import 'dart:convert';
import 'dart:math';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:v1/common/domain/DTO.dart';
import 'package:v1/common/domain/SocketDTO.dart';

class ApiClient {
  final IO.Socket _socket = IO.io('http://192.168.0.71:3000', {
    'transports': ['websocket', 'polling'],
    'autoConnect': false,
  });

  Map<String, Subscriber> subscribers = {};

  ApiClient() {
    print('try connect to: http://192.168.0.71:3000');
    _socket.onConnect(_onConnect);
    _socket.on('data', _onData);

    _socket.onError((data) => print(data));
    _socket.onConnectError((data) => print(data));

    _socket.connect();
  }

  String subscribe<T extends DTO>(String room, SubscribeCallback<T> callback,
      String type, DTOFactory<T> factory) {
    final subscriber = Subscriber(room, callback, type, factory);
    subscribers[subscriber.id] = subscriber;
    return subscriber.id;
  }

  unsubscribe(String id) {
    subscribers.remove(id);
  }

  _onConnect(dynamic handler) {
    print('Connect!');
  }

  _onData(dynamic data) {
    final bus = SocketBus.fromJson(jsonDecode(data));

    for (final subscriber in subscribers.values) {
      if (subscriber.room == bus.room && subscriber.type == bus.type) {
        final newInstance = subscriber.factory(bus.data);
        print(newInstance.toJson());
        (subscriber.callback as Function)(newInstance);
      }
    }
  }
}

class Subscriber<T extends DTO> {
  DTOFactory<T> factory;
  String id = Subscriber._generateID();
  String room;
  String type;
  SubscribeCallback<T> callback;

  Subscriber(this.room, this.callback, this.type, this.factory);

  static String _generateID() {
    var r = Random();
    return String.fromCharCodes(
        List.generate(999, (index) => r.nextInt(33) + 89));
  }
}

typedef SubscribeCallback<T extends DTO> = void Function(T dto);
