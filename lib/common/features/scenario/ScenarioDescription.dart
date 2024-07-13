import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class ScenarioDescription implements DTO {
  final String id;
  final String title;
  final String description;
  final String background;

  ScenarioDescription(
      {required this.id,
      required this.title,
      required this.description,
      required this.background});

  ScenarioDescription.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        background = json['background'];

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'background': background,
      };
}
