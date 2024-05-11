import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class ScenarioFact implements DTO {
  final String id;
  final String title;
  final String cardType;
  final String description;
  final String? fullDescription;

  ScenarioFact(
      {required this.id,
      required this.title,
      required this.cardType,
      required this.description,
      this.fullDescription});

  ScenarioFact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        cardType = json['cardType'],
        description = json['description'],
        fullDescription = json['fullDescription'];

  Map toJson() => {
        'id': id,
        'title': title,
        'cardType': cardType,
        'description': description,
        'fullDescription': fullDescription,
      };
}
