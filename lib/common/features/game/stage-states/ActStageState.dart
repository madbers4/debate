import 'package:v1/common/features/game/stage-states/GameStageState.dart';

class ActStageState extends GameStageState {
  final bool isCardsShowed;
  final bool isFirstCardShowed;
  final bool isSecondCardShowed;
  final bool isThirdCardShowed;

  const ActStageState(
      {super.id = '1',
      this.isCardsShowed = false,
      this.isFirstCardShowed = false,
      this.isSecondCardShowed = false,
      this.isThirdCardShowed = false});

  static fromJson(Map<dynamic, dynamic> json) {
    return ActStageState(
        id: json['id'] as String,
        isCardsShowed: json['isCardsShowed'] as bool,
        isFirstCardShowed: json['isFirstCardShowed'] as bool,
        isSecondCardShowed: json['isSecondCardShowed'] as bool,
        isThirdCardShowed: json['isThirdCardShowed'] as bool);
  }

  Map toJson() => {
        'id': id,
        'isCardsShowed': isCardsShowed,
        'isFirstCardShowed': isFirstCardShowed,
        'isSecondCardShowed': isSecondCardShowed,
        'isThirdCardShowed': isThirdCardShowed,
      };
}
