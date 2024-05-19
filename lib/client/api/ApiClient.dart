import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/common/features/settings/Settings.dart';

class ApiClient extends ChangeNotifier {
  SocketClient? socketClient = null;
  IO.Socket? _socket = null;
  String? apiHost;
  final List _connectSubscribers = [];
  final List _conErrorSubscribers = [];

  ApiClient();

  connect(Settings settings) {
    if (apiHost == settings.apiHost) {
      return;
    }

    apiHost = settings.apiHost;

    if (_socket != null) {
      _socket!.clearListeners();
      _socket!.close();
      socketClient!.unsubscribeAll();
    }

    _socket = IO.io(apiHost, {
      'transports': ['websocket', 'polling'],
      'autoConnect': false,
      
    });

    print(_socket!.query);
    print('try connect to: ${apiHost}');

    _socket!.onConnect((data) {
      print('Connect!');

      for (final callback in _connectSubscribers) {
        callback();
      }
    });

    _socket!.onError((data) {
      print(data);
    });

    _socket!.onConnectError((data) {
      print(data);

      for (final callback in _conErrorSubscribers) {
        callback();
      }
    });

    _socket!.connect();

    socketClient = SocketClient(io: _socket);

    notifyListeners();
  }

  subConnect(void Function() callback) {
    _connectSubscribers.add(callback);
  }

  subConnectError(void Function() callback) {
    _conErrorSubscribers.add(callback);
  }

  unsubscribe(void Function() callback) {
    _connectSubscribers.remove(callback);
    _conErrorSubscribers.remove(callback);
  }
}
