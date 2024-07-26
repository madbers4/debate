import 'package:v1/common/features/game/GameStage.dart';
import 'package:v1/common/features/game/GameStageStates.dart';
import 'package:v1/common/features/scenario/Scenario.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class Game implements DTO {
  static int maxAttempts = 3;

  final String id;
  final Scenario scenario;
  final GameStage gameStage;
  final GameStageStates stageStates;
  final int gameTime;

  Game(
      {required this.id,
      required this.scenario,
      required this.gameStage,
      required this.stageStates,
      this.gameTime = 180000});

  Game.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        gameTime = json['gameTime'],
        scenario = Scenario.fromJson(json['scenario']),
        gameStage = GameStage.values
            .firstWhere((e) => e.toString() == json['gameStage']),
        stageStates = GameStageStates.fromJson(json['stageStates']);

  Map toJson() => {
        'id': id,
        'gameTime': gameTime,
        'scenario': scenario.toJson(),
        'gameStage': gameStage.toString(),
        'stageStates': stageStates.toJson(),
      };
}
