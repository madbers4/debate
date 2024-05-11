import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class ScenarioDefendantOrigin implements DTO {
  final String id;
  final String title;
  final String? additionalTitle;
  final String description;

  ScenarioDefendantOrigin(
      {required this.id,
      required this.title,
      this.additionalTitle,
      required this.description});

  ScenarioDefendantOrigin.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        additionalTitle = json['additionalTitle'];

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'additionalTitle': additionalTitle,
      };
}
