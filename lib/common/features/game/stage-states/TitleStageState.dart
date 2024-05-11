import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class TitleStageState implements DTO {
  final String id;
  final bool isDescriptionShowed;

  const TitleStageState({this.id = '1', this.isDescriptionShowed = true});

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
