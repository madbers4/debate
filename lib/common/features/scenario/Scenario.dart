import 'dart:convert';

import 'package:socket_io/socket_io.dart';
import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/scenario/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedenceFabric.dart';

class Scenario implements DTO {
  final String id;
  final ScenarioDescription description;
  final List<ScenarioEvent> events;
  final List<ScenarioEvedence> evedences;

  Scenario(
      {required this.id,
      required this.description,
      required this.events,
      required this.evedences});

  Scenario.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        description = ScenarioDescription.fromJson(json['description']),
        events =
            List.from(json['events'].map<ScenarioEvent>((json) => ScenarioEvent.fromJson(json))),
        evedences =
            List.from(json['evedences'].map<ScenarioEvedence>((json) => ScenarioEvedenceFabric(json: json).build()));

  Map toJson() => {
        'id': id,
        'description': description.toJson(),
        'events': jsonEncode(events.map((e) => e.toJson())),
        'evedences': jsonEncode(evedences.map((e) => e.toJson()))
      };
}
