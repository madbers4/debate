import 'package:v1/common/features/player/Player.dart';

class Judge extends Player {
  Judge({required super.id, required super.name});

  Judge.fromJson(Map<dynamic, dynamic> json)
      : super(id: json['id'] as String, name: json['name'] as String);
}
