import 'package:v1/common/features/game/stage-states/ActStageState.dart';
import 'package:v1/common/features/game/stage-states/DefendantStageState.dart';
import 'package:v1/common/features/game/stage-states/GameStageState.dart';
import 'package:v1/common/features/game/stage-states/TitleStageState.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';

class GameStageStates implements DTO {
  @override
  String id = '1';
  TitleStageState title;
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
        defendant = DefendantStageState.fromJson(json['defendant']),
        act1 = ActStageState.fromJson(json['act1']),
        act2 = ActStageState.fromJson(json['act2']),
        act3 = ActStageState.fromJson(json['act3']),
        act4 = ActStageState.fromJson(json['act4']);

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

  static GameStageStates fromExisting(
      GameStageStates states, GameStageState state, [String? stateName]) {
    return GameStageStates(
      title: state is TitleStageState ? state : states.title,
      act1: state is ActStageState && stateName == 'act1' ? state : states.act1,
      act2: state is ActStageState && stateName == 'act2' ? state : states.act2,
      act3: state is ActStageState && stateName == 'act3' ? state : states.act3,
      act4: state is ActStageState && stateName == 'act4' ? state : states.act4,
      defendant: state is DefendantStageState ? state : states.defendant,
    );
  }
}
