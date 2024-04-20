import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class ScenarioDescription implements DTO {
  final String id;
  final String title;
  final String description;
  final String playerDescription;

  ScenarioDescription(
      {required this.id,
      required this.title,
      required this.description,
      required this.playerDescription});

  ScenarioDescription.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        playerDescription = json['playerDescription'];

  Map toJson() => {
        'id': id,
        'title': title,
        'description': title,
        'playerDescription': playerDescription
      };
}
