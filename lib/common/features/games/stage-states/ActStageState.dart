import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class ActStageState implements DTO {
  final String id;
  final bool isCardsShowed;
  final bool isFirstCardShowed;
  final bool isSecondCardShowed;
  final bool isThirdCardShowed;

  const ActStageState(
      {this.id = '1',
      this.isCardsShowed = false,
      this.isFirstCardShowed = false,
      this.isSecondCardShowed = false,
      this.isThirdCardShowed = false});

  static fromJson(Map<dynamic, dynamic> json) {
    return ActStageState(
        id: json['id'] as String,
        isCardsShowed: json['isDescriptionShowed'] as bool,
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
