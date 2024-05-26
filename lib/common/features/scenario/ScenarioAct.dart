import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/event/ScenarioEventFactory.dart';

class ScenarioAct implements DTO {
  final String id;
  final String title;
  final String description;
  final List<ScenarioEvent> events;

  ScenarioAct(
      {required this.id,
      required this.title,
      required this.description,
      required this.events});

  ScenarioAct.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        events = List.from(json['events'].map<ScenarioEvent>(
            (json) => ScenarioEventFactory(json: json).build()));

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'events': events.map((e) => e.toJson()).toList()
      };
}
