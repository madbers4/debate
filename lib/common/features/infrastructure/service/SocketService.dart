import 'package:v1/common/features/infrastructure/service/Service.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';

class SocketService extends Service<SocketService> {
  List<SocketClient> _clients = [];

  SocketService({required super.serviceProvider});

  addClient(SocketClient client) {
    _clients.add(client);
  }

  removeClient(SocketClient client) {
    _clients.remove(client);
  }
}
