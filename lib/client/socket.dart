// import 'dart:async';
// import 'dart:convert';

// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:v1/common/domain/Player.dart';

//  // Dart client
//   IO.Socket socket = IO.io('http://localhost:3000', {
//         'transports': ['websocket','polling'],
//         'autoConnect': true,
//     });
  
  
//   socket.onConnect((_) {
//     print('connect');

//     final player = Player(id: '1', name: 'Furina');

//     socket.emit('data', jsonEncode(player.toJson()));
//   });
  
//   socket.on('data', (data) {
//       print(Player.fromJson(jsonDecode(data)));
//   });
  
  // socket.onDisconnect((_) => print('disconnect'));
  // socket.on('fromServer', (_) => print(_));
  // socket.on('disconnect', (_) => print('disconnect'));