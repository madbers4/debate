import 'package:v1/common/features/game/stage-states/GameStageState.dart';

class JudgementStageState extends GameStageState {
  final String id;

  const JudgementStageState({this.id = '1'});

  static JudgementStageState fromJson(Map<dynamic, dynamic> json) {
    return JudgementStageState(id: json['id'] as String);
  }

  Map toJson() => {
        'id': id,
      };
}
