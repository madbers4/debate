import 'package:v1/common/features/game/stage-states/GameStageState.dart';
import 'package:v1/common/features/scenario/ScenarioActId.dart';

class DebatesStageState extends GameStageState {
  final String id;
  final String? selectedEventId;
  final String? selectedEvidenceId;
  final bool? inDenial;
  final bool? isDebatesOver;
  final bool? isDebatesTimeout;
  final bool? isDefendentInnocent;
  final bool? inPause;
  final num incorrectAttempts;
  final List<String> refusedEvents;
  final ActId showedActId;

  const DebatesStageState(
      {this.id = '1',
      this.refusedEvents = const [],
      this.showedActId = ActId.One,
      this.incorrectAttempts = 0,
      this.selectedEventId,
      this.selectedEvidenceId,
      this.inDenial,
      this.isDebatesOver,
      this.isDebatesTimeout,
      this.isDefendentInnocent,
      this.inPause});

  static DebatesStageState fromJson(Map<dynamic, dynamic> json) {
    return DebatesStageState(
        id: json['id'] as String,
        selectedEventId: json['selectedEventId'] != null
            ? json['selectedEventId'] as String
            : null,
        selectedEvidenceId: json['selectedEvidenceId'] != null
            ? json['selectedEvidenceId'] as String
            : null,
        inDenial: json['inDenial'] != null ? json['inDenial'] as bool : null,
        isDebatesOver: json['isDebatesOver'] != null
            ? json['isDebatesOver'] as bool
            : null,
        isDebatesTimeout: json['isDebatesTimeout'] != null
            ? json['isDebatesTimeout'] as bool
            : null,
        isDefendentInnocent: json['isDefendentInnocent'] != null
            ? json['isDefendentInnocent'] as bool
            : null,
        inPause: json['inPause'] != null ? json['inPause'] as bool : null,
        incorrectAttempts: json['incorrectAttempts'] != null
            ? json['incorrectAttempts'] as num
            : 0,
        refusedEvents: json['refusedEvents'] != null
            ? List.from(json['refusedEvents'])
            : [],
        showedActId: ActId.values
            .firstWhere((e) => e.toString() == json['showedActId']));
  }

  Map toJson() => {
        'id': id,
        'selectedEventId': selectedEventId,
        'selectedEvidenceId': selectedEvidenceId,
        'inDenial': inDenial,
        'isDebatesOver': isDebatesOver,
        'isDebatesTimeout': isDebatesTimeout,
        'isDefendentInnocent': isDefendentInnocent,
        'inPause': inPause,
        'incorrectAttempts': incorrectAttempts,
        'refusedEvents': refusedEvents,
        'showedActId': showedActId.toString()
      };
}
