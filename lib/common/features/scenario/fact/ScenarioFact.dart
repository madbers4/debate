import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class ScenarioFact implements DTO {
  final String id;
  final String title;
  final String description;

  ScenarioFact(
      {required this.id, required this.title, required this.description});

  ScenarioFact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'];

  Map toJson() => {
        'id': id,
        'title': title,
        'description': title,
      };
}
