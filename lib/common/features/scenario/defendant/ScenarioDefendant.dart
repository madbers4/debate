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
        bornOrigin = ScenarioDefendantOrigin.fromJson(json['bornOrigin']),
        professionOrigin =
            ScenarioDefendantOrigin.fromJson(json['professionOrigin']),
        secretOrigin = ScenarioDefendantOrigin.fromJson(json['secretOrigin']);

  Map toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'bornOrigin': bornOrigin.toJson(),
        'professionOrigin': professionOrigin.toJson(),
        'secretOrigin': secretOrigin.toJson(),
      };
}
