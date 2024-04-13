import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/player/Role.dart';

class JoinRoomArgs implements DTO {
  String id = 'null';
  String roomId;
  Role role;

  JoinRoomArgs({required this.roomId, required this.role});

  JoinRoomArgs.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        roomId = json['roomId'] as String,
        role = Role.values.firstWhere((e) => e.toString() == json['role']);

  Map toJson() => {'id': id, 'roomId': roomId, 'role': role.toString()};
}
