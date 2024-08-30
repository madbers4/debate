import 'package:v1/common/features/game/stage-states/ActStageState.dart';
import 'package:v1/common/features/game/stage-states/DefendantStageState.dart';
import 'package:v1/common/features/game/stage-states/EvidencesState.dart';
import 'package:v1/common/features/game/stage-states/DebatesStageState.dart';
import 'package:v1/common/features/game/stage-states/GameStageState.dart';
import 'package:v1/common/features/game/stage-states/JudgementStageState.dart';
import 'package:v1/common/features/game/stage-states/TitleStageState.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class GameStageStates implements DTO {
  @override
  String id = '1';
  TitleStageState title;
  DefendantStageState defendant;
  ActStageState act1;
  EvidencesStageState evidences;
  DebatesStageState debates;
  JudgementStageState judgement;

  GameStageStates(
      {this.title = const TitleStageState(),
      this.defendant = const DefendantStageState(),
      this.act1 = const ActStageState(),
      this.evidences = const EvidencesStageState(),
      this.debates = const DebatesStageState(),
      this.judgement = const JudgementStageState()});

  GameStageStates.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        title = TitleStageState.fromJson(json['title']),
        defendant = DefendantStageState.fromJson(json['defendant']),
        act1 = ActStageState.fromJson(json['act1']),
        evidences = EvidencesStageState.fromJson(json['evidences']),
        debates = DebatesStageState.fromJson(json['debates']),
        judgement = JudgementStageState.fromJson(json['judgement']);

  @override
  Map toJson() => {
        'id': id,
        'title': title.toJson(),
        'defendant': defendant.toJson(),
        'act1': act1.toJson(),
        'evidences': evidences.toJson(),
        'debates': debates.toJson(),
        'judgement': judgement.toJson(),
      };

  static GameStageStates fromExisting(
      GameStageStates states, GameStageState state,
      [String? stateName]) {
    return GameStageStates(
        title: state is TitleStageState ? state : states.title,
        act1:
            state is ActStageState && stateName == 'act1' ? state : states.act1,
        defendant: state is DefendantStageState ? state : states.defendant,
        evidences: state is EvidencesStageState ? state : states.evidences,
        debates: state is DebatesStageState ? state : states.debates,
        judgement: state is JudgementStageState ? state : states.judgement);
  }
}
