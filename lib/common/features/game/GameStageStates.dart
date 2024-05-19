import 'package:v1/common/features/game/stage-states/ActStageState.dart';
import 'package:v1/common/features/game/stage-states/DefendantStageState.dart';
import 'package:v1/common/features/game/stage-states/TitleStageState.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';

class GameStageStates implements DTO {
  @override
  String id = '1';
  final TitleStageState title;
  DefendantStageState defendant;
  ActStageState act1;
  ActStageState act2;
  ActStageState act3;
  ActStageState act4;
  Void evidences = Void();
  Void debates = Void();
  Void judgement = Void();
  Void finish = Void();

  GameStageStates(
      {this.title = const TitleStageState(),
      this.defendant = const DefendantStageState(),
      this.act1 = const ActStageState(),
      this.act2 = const ActStageState(),
      this.act3 = const ActStageState(),
      this.act4 = const ActStageState()});

  GameStageStates.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        title = TitleStageState.fromJson(json['title']),
        defendant = TitleStageState.fromJson(json['defendant']),
        act1 = TitleStageState.fromJson(json['act1']),
        act2 = TitleStageState.fromJson(json['act2']),
        act3 = TitleStageState.fromJson(json['act3']),
        act4 = TitleStageState.fromJson(json['act4']);

  @override
  Map toJson() => {
        'id': id,
        'title': title.toJson(),
        'defendant': defendant.toJson(),
        'act1': act1.toJson(),
        'act2': act2.toJson(),
        'act3': act3.toJson(),
        'act4': act4.toJson(),
      };
}
