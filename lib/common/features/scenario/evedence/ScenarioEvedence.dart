import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class ScenarioEvedence implements DTO {
  final String id;
  final String title;
  final String description;

  ScenarioEvedence(
      {required this.id, required this.title, required this.description});

  ScenarioEvedence.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'];

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };
}
