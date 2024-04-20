import 'package:v1/common/features/scenario/fact/ScenarioFact.dart';

class ScenarioFalsyFact extends ScenarioFact {
  final String falsyDescription;

  ScenarioFalsyFact(
      {required super.id,
      required super.title,
      required super.description,
      required this.falsyDescription});

  ScenarioFalsyFact.fromJson(Map<String, dynamic> json)
      : falsyDescription = json['falsyDescription'] as String,
        super(
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String);

  Map toJson() => {
        'id': id,
        'title': title,
        'description': title,
        'falsyDescription': falsyDescription,
      };
}
