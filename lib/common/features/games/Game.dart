import 'package:v1/common/features/games/GameStage.dart';
import 'package:v1/common/features/games/GameStageStates.dart';
import 'package:v1/common/features/scenario/Scenario.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class Game implements DTO {
  final String id;
  final Scenario scenario;
  final GameStage gameStage;
  final GameStageStates stageStates;

  Game(
      {required this.id,
      required this.scenario,
      required this.gameStage,
      required this.stageStates});

  Game.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        scenario = Scenario.fromJson(json['scenario']),
        gameStage = GameStage.values
            .firstWhere((e) => e.toString() == json['gameStage']),
        stageStates = GameStageStates.fromJson(json['stageStates']);

  Map toJson() => {
        'id': id,
        'scenario': scenario.toJson(),
        'gameStage': gameStage.toString(),
        'stageStates': gameStage.toString(),
      };
}
