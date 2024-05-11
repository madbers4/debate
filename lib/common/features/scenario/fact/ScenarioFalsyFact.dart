import 'package:v1/common/features/scenario/fact/ScenarioFact.dart';

class ScenarioFalsyFact extends ScenarioFact {
  final String falsyDescription;

  ScenarioFalsyFact(
      {required super.id,
      required super.title,
      required super.cardType,
      required this.falsyDescription,
      required super.description,
      super.fullDescription});

  ScenarioFalsyFact.fromJson(Map<String, dynamic> json)
      : falsyDescription = json['falsyDescription'] as String,
        super(
            id: json['id'] as String,
            title: json['title'] as String,
            cardType: json['cardType'] as String,
            description: json['description'] as String,
            fullDescription: json['fullDescription'] as String);

  Map toJson() => {
        'id': id,
        'title': title,
        'cardType': cardType,
        'falsyDescription': falsyDescription,
        'description': description,
        'fullDescription': fullDescription,
      };
}
