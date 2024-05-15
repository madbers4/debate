import 'package:v1/common/features/player/Player.dart';
import 'package:v1/common/utils/generateUID.dart';

class Plaintiff extends Player {
  Plaintiff({super.name = 'observer'}) : super(id: generateUID());

  Plaintiff.fromJson(Map<dynamic, dynamic> json)
      : super(id: json['id'] as String, name: json['name'] as String);
}
