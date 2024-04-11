import 'package:v1/common/features/infrastructure/service/SocketService.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/server/features/autorization/AutorizationEndpoint.dart';

class AutorizationService extends SocketService {
  AutorizationService({required super.serviceProvider});

  @override
  addClient(SocketClient client) {
    super.addClient(client);

    AutorizationEndpoint endpoint = AutorizationEndpoint(client);
  }
}
