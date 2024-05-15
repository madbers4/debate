import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class CreateRoomArgs implements DTO {
  String id = 'null';
  String name;

  CreateRoomArgs({required this.name});

  CreateRoomArgs.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        name = json['name'];

  Map toJson() => {'id': id, 'name': name};
}
