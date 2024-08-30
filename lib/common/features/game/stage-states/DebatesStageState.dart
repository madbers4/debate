import 'package:v1/common/features/game/stage-states/GameStageState.dart';
import 'package:v1/common/features/scenario/ScenarioActId.dart';

class DebatesStageState extends GameStageState {
  final String id;
  final String? selectedEventId;
  final String? selectedEvidenceId;
  final bool? inDenial;
  final bool? inDenialNotConfirmed;
  final bool? inDenialConfirmed;
  final int denialConfirmedCurrentPage;
  final bool? isDebatesOver;
  final bool? isDebatesTimeout;
  final bool? isDefendentInnocent;
  final bool inPause;
  final bool? inPauseOvrl;
  final num incorrectAttempts;
  final List<String> refusedEvents;
  final String showedActId;

  const DebatesStageState(
      {this.id = '1',
      this.refusedEvents = const [],
      this.showedActId = actOneId,
      this.incorrectAttempts = 0,
      this.selectedEventId,
      this.selectedEvidenceId,
      this.inDenial,
      this.inDenialNotConfirmed,
      this.inDenialConfirmed,
      this.denialConfirmedCurrentPage = 0,
      this.isDebatesOver,
      this.isDebatesTimeout,
      this.isDefendentInnocent,
      this.inPauseOvrl,
      this.inPause = false});

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
        inDenialNotConfirmed: json['inDenialNotConfirmed'] != null
            ? json['inDenialNotConfirmed'] as bool
            : null,
        inDenialConfirmed: json['inDenialConfirmed'] != null
            ? json['inDenialConfirmed'] as bool
            : null,
        denialConfirmedCurrentPage: json['denialConfirmedCurrentPage'] as int,
        isDebatesOver: json['isDebatesOver'] != null
            ? json['isDebatesOver'] as bool
            : null,
        isDebatesTimeout: json['isDebatesTimeout'] != null
            ? json['isDebatesTimeout'] as bool
            : null,
        inPauseOvrl:
            json['inPauseOvrl'] != null ? json['inPauseOvrl'] as bool : null,
        isDefendentInnocent: json['isDefendentInnocent'] != null
            ? json['isDefendentInnocent'] as bool
            : null,
        inPause: json['inPause'] as bool,
        incorrectAttempts: json['incorrectAttempts'] != null
            ? json['incorrectAttempts'] as num
            : 0,
        refusedEvents: json['refusedEvents'] != null
            ? List.from(json['refusedEvents'])
            : [],
        showedActId: json['showedActId']);
  }

  Map toJson() => {
        'id': id,
        'selectedEventId': selectedEventId,
        'selectedEvidenceId': selectedEvidenceId,
        'inDenial': inDenial,
        'inDenialNotConfirmed': inDenialNotConfirmed,
        'inDenialConfirmed': inDenialConfirmed,
        'denialConfirmedCurrentPage': denialConfirmedCurrentPage,
        'isDebatesOver': isDebatesOver,
        'isDebatesTimeout': isDebatesTimeout,
        'isDefendentInnocent': isDefendentInnocent,
        'inPause': inPause,
        'inPauseOvrl': inPauseOvrl,
        'incorrectAttempts': incorrectAttempts,
        'refusedEvents': refusedEvents,
        'showedActId': showedActId,
      };
}
