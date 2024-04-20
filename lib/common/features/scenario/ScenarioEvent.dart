import 'dart:convert';

import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/scenario/fact/ScenarioFact.dart';
import 'package:v1/common/features/scenario/fact/ScenarioFactFabric.dart';

class ScenarioEvent implements DTO {
  final String id;
  final String title;
  final String description;
  final List<ScenarioFact> facts;

  ScenarioEvent(
      {required this.id,
      required this.title,
      required this.description,
      required this.facts});

  ScenarioEvent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        facts = List.from(json['facts'].map<ScenarioFact>(
            (json) => ScenarioFactFabric(json: json).build()));

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'facts': jsonEncode(facts.map((e) => e.toJson()))
      };
}
