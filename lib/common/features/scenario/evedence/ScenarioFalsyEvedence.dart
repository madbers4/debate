import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';

class ScenarioFalsyEvedence extends ScenarioEvedence {
  final String falsyFactId;

  ScenarioFalsyEvedence(
      {required super.id,
      required super.title,
      required super.description,
      required this.falsyFactId});

  ScenarioFalsyEvedence.fromJson(Map<String, dynamic> json)
      : falsyFactId = json['falsyFactId'] as String,
        super(
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String);

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'falsyFactId': falsyFactId,
      };
}
