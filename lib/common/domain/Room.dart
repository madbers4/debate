import 'package:v1/common/domain/Id.dart';

class Room implements Id {
  String id;

  Room({required this.id});

  Room.fromJson(Map<String, dynamic> json) 
      : id = json['id'] as String;

  Map toJson() => {
      'id': id,
  };
}
