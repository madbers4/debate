import 'package:v1/common/domain/Id.dart';

class Player implements Id {
  String name;
  String id;

  Player({required this.id, required this.name});
  
  Player.fromJson(Map<String, dynamic> json) 
      : id = json['id'] as String,
        name = json['name'] as String;

  Map toJson() => {
      'id': id,
      'name': name,
  };
}
