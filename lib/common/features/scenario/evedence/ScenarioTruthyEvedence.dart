import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';

class ScenarioTruthyEvedence extends ScenarioEvedence {
  final String falsyEventId;
  final String falsyDescription;
  final String triggeredTransitionId;

  ScenarioTruthyEvedence(
      {required super.id,
      required super.title,
      required super.description,
      required this.falsyDescription,
      required this.falsyEventId,
      required this.triggeredTransitionId});

  ScenarioTruthyEvedence.fromJson(Map<dynamic, dynamic> json)
      : falsyEventId = json['falsyEventId'] as String,
        falsyDescription = json['falsyDescription'] as String,
        triggeredTransitionId = json['triggeredTransitionId'] as String,
        super(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
        );

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'falsyEventId': falsyEventId,
        'falsyDescription': falsyDescription,
        'triggeredTransitionId': triggeredTransitionId,
      };
}
