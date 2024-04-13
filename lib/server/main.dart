import 'package:socket_io/socket_io.dart';
import 'package:v1/common/features/infrastructure/Provider.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/common/features/infrastructure/service/SocketService.dart';
import 'package:v1/server/features/autorization/AutorizationService.dart';
import 'package:v1/server/features/rooms/RoomsService.dart';

handler(data) {}

void main(List<String> arguments) {
  final io = Server();
  final socketServiceProvider = Provider<SocketService>();

  socketServiceProvider.add<AutorizationService>(
      AutorizationService(serviceProvider: socketServiceProvider));
  socketServiceProvider
      .add<RoomsService>(RoomsService(serviceProvider: socketServiceProvider));

  io.on('connection', (client) {
    print('connection default namespace');
    final socketClient = SocketClient(io: client);

    for (final service in socketServiceProvider.getAll()) {
      service.addClient(socketClient);
    }

    client.on('disconnect', (_) {
      for (final service in socketServiceProvider.getAll()) {
        service.removeClient(socketClient);
      }
    });
  });

  io.listen(3000);
}
