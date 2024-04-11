import 'package:v1/common/features/player/Player.dart';

class Defendant extends Player {
  Defendant({required super.id, required super.name});

  Defendant.fromJson(Map<dynamic, dynamic> json)
      : super(id: json['id'] as String, name: json['name'] as String);
}
