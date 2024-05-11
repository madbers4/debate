import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';

class ScenarioDefendant implements DTO {
  final String id;
  final String name;
  final String description;
  final ScenarioDefendantOrigin bornOrigin;
  final ScenarioDefendantOrigin professionOrigin;
  final ScenarioDefendantOrigin secretOrigin;

  ScenarioDefendant({
    required this.id,
    required this.name,
    required this.description,
    required this.bornOrigin,
    required this.professionOrigin,
    required this.secretOrigin,
  });

  ScenarioDefendant.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        bornOrigin = json['bornOrigin'],
        professionOrigin = json['professionOrigin'],
        secretOrigin = json['secretOrigin'];

  Map toJson() => {
        'id': id,
        'title': name,
        'description': description,
        'playerDescription': bornOrigin,
        'professionOrigin': professionOrigin,
        'secretOrigin': secretOrigin,
      };
}
