import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';

class ScenarioFalsyFact extends ScenarioEvent {
  final String falsyDescription;

  ScenarioFalsyFact(
      {required super.id,
      required super.title,
      required this.falsyDescription,
      required super.description,
      super.fullDescription});

  ScenarioFalsyFact.fromJson(Map<dynamic, dynamic> json)
      : falsyDescription = json['falsyDescription'] as String,
        super(
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String,
            fullDescription: json['fullDescription'] as String);

  Map toJson() => {
        'id': id,
        'title': title,
        'falsyDescription': falsyDescription,
        'description': description,
        'fullDescription': fullDescription,
      };
}
