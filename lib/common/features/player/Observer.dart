import 'package:v1/common/features/player/Player.dart';

class Observer extends Player {
  Observer({required super.id, required super.name});

  Observer.fromJson(Map<dynamic, dynamic> json)
      : super(id: json['id'] as String, name: json['name'] as String);
}
