import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class DefendantStageState implements DTO {
  final String id;
  final bool isCardsShowed;

  const DefendantStageState({this.id = '1', this.isCardsShowed = true});

  static fromJson(Map<dynamic, dynamic> json) {
    return DefendantStageState(
        id: json['id'] as String, isCardsShowed: json['isCardsShowed'] as bool);
  }

  Map toJson() => {
        'id': id,
        'isCardsShowed': isCardsShowed,
      };
}
