import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';

class ScenarioTruthyEvedence extends ScenarioEvedence {
  final String falsyEventId;

  ScenarioTruthyEvedence(
      {required super.id,
      required super.title,
      required super.description,
      required this.falsyEventId});

  ScenarioTruthyEvedence.fromJson(Map<String, dynamic> json)
      : falsyEventId = json['falsyEventId'] as String,
        super(
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String);

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'falsyEventId': falsyEventId,
      };
}
