import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class Player implements DTO {
  String name;
  String id;

  Player({required this.id, required this.name});

  Player.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String;

  Map toJson() => {
        'id': id,
        'name': name,
      };
}
