import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class ScenarioEvent implements DTO {
  final String id;
  final String title;
  final String cardType;
  final String description;
  final bool? isHidden;
  final String? fullDescription;

  ScenarioEvent(
      {required this.id,
      required this.title,
      required this.cardType,
      required this.description,
      this.isHidden,
      this.fullDescription});

  ScenarioEvent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        cardType = json['cardType'],
        description = json['description'],
        fullDescription = json['fullDescription'],
        isHidden = json['isHidden'];

  Map toJson() => {
        'id': id,
        'title': title,
        'cardType': cardType,
        'description': description,
        'fullDescription': fullDescription,
        'isHidden': isHidden,
      };
}
