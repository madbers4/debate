import 'package:v1/common/features/infrastructure/dto/Id.dart';

class GameCard implements Id {
  String id;
  String title;
  String description;
  String? frontBackgroundPath;
  String? backBackgroundPath;

  GameCard({required this.id, required this.title, required this.description, this.frontBackgroundPath, this.backBackgroundPath});

  GameCard.fromJson(Map<String, dynamic> json) 
      : id = json['id'] as String,
      title = json['id'] as String,
      description = json['description'] as String,
      frontBackgroundPath = json['frontBackgroundPath'] as String,
      backBackgroundPath = json['backBackgroundPath'] as String;

  Map toJson() => {
      'id': id,
      'title': title,
      'description': description,
      'frontBackgroundPath': frontBackgroundPath,
      'backBackgroundPath': backBackgroundPath,
  };
}
