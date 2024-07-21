import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendant.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedenceFactory.dart';
import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEvent.dart';

class Scenario implements DTO {
  final String id;
  final ScenarioDescription description;
  final ScenarioDefendant defendant;
  final List<ScenarioAct> acts;
  final List<ScenarioEvedence> evedences;
  final List<TransitionEvent> transitionEvents;

  late final Map<String, ScenarioEvent> eventById;
  late final Map<String, ScenarioEvedence> evidenceById;
  late final Map<String, TransitionEvent> transitionEventById;

  Scenario({
    required this.id,
    required this.description,
    required this.defendant,
    required this.acts,
    required this.evedences,
    required this.transitionEvents,
  }) {
    evidenceById = Map.fromEntries(evedences.map((e) => MapEntry(e.id, e)));
    eventById = Map.fromEntries(acts
        .map((e) => e.events)
        .expand((element) => element)
        .map((e) => MapEntry(e.id, e)));
    transitionEventById =
        Map.fromEntries(transitionEvents.map((e) => MapEntry(e.id, e)));
  }

  static Scenario fromJson(Map<String, dynamic> json) {
    return Scenario(
        id: json['id'],
        description: ScenarioDescription.fromJson(json['description']),
        defendant: ScenarioDefendant.fromJson(json['defendant']),
        acts: List.from(json['acts']
            .map<ScenarioAct>((json) => ScenarioAct.fromJson(json))),
        evedences: List.from(json['evedences'].map<ScenarioEvedence>(
            (json) => ScenarioEvedenceFactory(json: json).build())),
        transitionEvents: List.from(json['acts']
            .map<TransitionEvent>((json) => TransitionEvent.fromJson(json))));
  }

  Map toJson() => {
        'id': id,
        'description': description.toJson(),
        'defendant': defendant.toJson(),
        'acts': acts.map((e) => e.toJson()).toList(),
        'evedences': evedences.map((e) => e.toJson()).toList(),
        'transitionEvents': transitionEvents.map((e) => e.toJson()).toList(),
      };
}
