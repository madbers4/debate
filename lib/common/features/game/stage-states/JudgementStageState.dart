import 'package:v1/common/features/game/stage-states/GameStageState.dart';

class JudgementStageState extends GameStageState {
  final String id;
  final bool foundGuilty;

  const JudgementStageState({this.id = '1', this.foundGuilty = false});

  static JudgementStageState fromJson(Map<dynamic, dynamic> json) {
    return JudgementStageState(
        id: json['id'] as String, foundGuilty: json['foundGuilty'] as bool);
  }

  Map toJson() => {
        'id': id,
        'foundGuilty': foundGuilty,
      };
}
