import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class ScenarioEvent implements DTO {
  final String id;
  final String title;
  final String description;
  final bool? isHidden;
  final String? fullDescription;

  ScenarioEvent(
      {required this.id,
      required this.title,
      required this.description,
      this.isHidden,
      this.fullDescription});

  ScenarioEvent.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        fullDescription = json['fullDescription'],
        isHidden = json['isHidden'];

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'fullDescription': fullDescription,
        'isHidden': isHidden,
      };
}
