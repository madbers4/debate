import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';

class ApiClient {
  final IO.Socket _socket = IO.io('http://localhost:3000', {
    'transports': ['websocket', 'polling'],
    'autoConnect': false,
  });
  late SocketClient socketClient;
  final List _connectSubscribers = [];
  final List _conErrorSubscribers = [];

  ApiClient() {
    print(_socket.query);
    print('try connect to: http://localhost:3000');
    _socket.onConnect((data) {
      print('Connect!');

      for (final callback in _connectSubscribers) {
        callback();
      }
    });

    _socket.onError((data) {
      print(data);
    });

    _socket.onConnectError((data) {
      // print(data);

      for (final callback in _conErrorSubscribers) {
        callback();
      }
    });

    _socket.connect();

    socketClient = SocketClient(io: _socket);
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
