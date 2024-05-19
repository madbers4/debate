import 'package:v1/common/features/player/Player.dart';
import 'package:v1/common/utils/generateUID.dart';

class Defendant extends Player {
  @override
  String title = 'Обвиняемый';

  Defendant({required super.name}) : super(id: generateUID());

  Defendant.fromJson(Map<dynamic, dynamic> json)
      : super(id: json['id'] as String, name: json['name'] as String);
}
