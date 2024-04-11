import 'package:v1/common/features/player/Player.dart';

class Plaintiff extends Player {
  Plaintiff({required super.id, required super.name});

  Plaintiff.fromJson(Map<dynamic, dynamic> json)
      : super(id: json['id'] as String, name: json['name'] as String);
}
