import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';

class ScenarioTruthyEvedence extends ScenarioEvedence {
  final String falsyFactId;

  ScenarioTruthyEvedence(
      {required super.id,
      required super.title,
      required super.description,
      required this.falsyFactId});

  ScenarioTruthyEvedence.fromJson(Map<String, dynamic> json)
      : falsyFactId = json['falsyFactId'] as String,
        super(
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String);

  Map toJson() => {
        'id': id,
        'title': title,
        'description': title,
      };
}
