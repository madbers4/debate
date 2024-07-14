import 'package:v1/common/features/infrastructure/dto/Id.dart';

enum GameCardType { Evidence, Event, Origin }

class GameCard implements Id {
  String id;
  String title;
  String description;
  String? frontBackgroundPath;
  String? backBackgroundPath;
  GameCardType type;

  GameCard(
      {required this.id,
      required this.title,
      required this.description,
      this.frontBackgroundPath,
      this.backBackgroundPath,
      required this.type});

  GameCard.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['id'] as String,
        description = json['description'] as String,
        frontBackgroundPath = json['frontBackgroundPath'] as String,
        backBackgroundPath = json['backBackgroundPath'] as String,
        type =
            GameCardType.values.firstWhere((e) => e.toString() == json['type']);

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'frontBackgroundPath': frontBackgroundPath,
        'backBackgroundPath': backBackgroundPath,
        'type': type.toString(),
      };
}
