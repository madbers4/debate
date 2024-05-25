import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class GameStageState implements DTO {
  final String id;

  const GameStageState({this.id = '1'});

  static fromJson(Map<dynamic, dynamic> json) {
    return GameStageState(id: json['id'] as String);
  }

  Map toJson() => {
        'id': id,
      };
}
