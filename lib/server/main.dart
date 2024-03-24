import 'dart:convert';

import 'package:socket_io/socket_io.dart';
import 'package:v1/common/domain/Player.dart';

handler(data) {}

void main(List<String> arguments) {
 // Dart server
  var io = Server();

  // var nsp = io.of('/some');
  // nsp.on('conn(client) {
  //   print('connection /some');
  //   client.on('msg', (data) {
  //     print('data from /some => $data');
  //     client.emit('fromServer', "hello world 2");
  //   });
  // });ection', 
  
  io.on('connection', (client) {
    print('connection default namespace');
    client.on('data', (data) {
      print('data from default => ');
      print(Player.fromJson(jsonDecode(data)));
      // client.emit('fromServer', "hello world");
    });


    final player = Player(id: '1', name: 'Furina');
    client.emit('data', jsonEncode(player.toJson()));
  });


  io.listen(3000);
}