import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';

class ScenarioFalsyEvent extends ScenarioEvent {
  final bool? confirmsInnocence;
  // HARDCODE для фабрики
  final bool fEvent;

  ScenarioFalsyEvent(
      {required super.id,
      required super.title,
      this.confirmsInnocence,
      required super.description,
      this.fEvent = true,
      super.fullDescription});

  ScenarioFalsyEvent.fromJson(Map<dynamic, dynamic> json)
      : confirmsInnocence = json['confirmsInnocence'] != null
            ? json['confirmsInnocence'] as bool
            : null,
        fEvent = true,
        super(
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String,
            fullDescription: json['fullDescription'] != null
                ? json['fullDescription'] as String
                : null);

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'fullDescription': fullDescription,
        'confirmsInnocence': confirmsInnocence,
        'fEvent': fEvent,
      };
}
