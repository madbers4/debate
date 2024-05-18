import 'dart:convert';

import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/scenario/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendant.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedenceFactory.dart';

class Scenario implements DTO {
  final String id;
  final ScenarioDescription description;
  final ScenarioDefendant defendant;
  // TODO: refactor this on act and events
  final List<ScenarioEvent> events;
  final List<ScenarioEvedence> evedences;

  Scenario({
    required this.id,
    required this.description,
    required this.defendant,
    required this.events,
    required this.evedences,
  });

  Scenario.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        description = ScenarioDescription.fromJson(json['description']),
        defendant = ScenarioDefendant.fromJson(json['defendant']),
        events = List.from(json['events']
            .map<ScenarioEvent>((json) => ScenarioEvent.fromJson(json))),
        evedences = List.from(json['evedences'].map<ScenarioEvedence>(
            (json) => ScenarioEvedenceFactory(json: json).build()));

  Map toJson() => {
        'id': id,
        'description': description.toJson(),
        'defendant': defendant.toJson(),
        'events': jsonEncode(events.map((e) => e.toJson())),
        'evedences': jsonEncode(evedences.map((e) => e.toJson()))
      };
}
