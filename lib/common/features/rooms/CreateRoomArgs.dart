import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/player/Role.dart';

class CreateRoomArgs implements DTO {
  String id = 'null';
  String name;
  Role role;

  CreateRoomArgs({required this.name, required this.role});

  CreateRoomArgs.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        role = Role.values.firstWhere((e) => e.toString() == json['role']);

  Map toJson() => {'id': id, 'name': name, 'role': role.toString()};
}
