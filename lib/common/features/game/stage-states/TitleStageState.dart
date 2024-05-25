import 'package:v1/common/features/game/stage-states/GameStageState.dart';

class TitleStageState extends GameStageState {
  final bool isDescriptionShowed;

  const TitleStageState({super.id = '1', this.isDescriptionShowed = false});

  static fromJson(Map<dynamic, dynamic> json) {
    return TitleStageState(
        id: json['id'] as String,
        isDescriptionShowed: json['isDescriptionShowed'] as bool);
  }

  Map toJson() => {
        'id': id,
        'isDescriptionShowed': isDescriptionShowed,
      };
}
