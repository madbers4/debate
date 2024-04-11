import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';

class ApiClient {
  final IO.Socket _socket = IO.io('http://localhost:3000', {
    'transports': ['websocket', 'polling'],
    'autoConnect': false,
  });
  late SocketClient socketClient;

  ApiClient() {
    print(_socket.query);
    print('try connect to: http://localhost:3000');
    _socket.onConnect(_onConnect);

    _socket.onError((data) => print(data));
    _socket.onConnectError((data) => print(data));

    _socket.connect();

    socketClient = SocketClient(io: _socket);
  }

  _onConnect(dynamic handler) {
    print('Connect!');
  }
}
