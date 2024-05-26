import 'package:v1/common/features/game/stage-states/GameStageState.dart';

class DebatesStageState extends GameStageState {
  final String id;
  final String? selectedEventId;
  final String? selectedEvidenceId;

  const DebatesStageState(
      {this.id = '1', this.selectedEventId, this.selectedEvidenceId});

  static DebatesStageState fromJson(Map<dynamic, dynamic> json) {
    return DebatesStageState(
        id: json['id'] as String,
        selectedEventId: json['selectedEventId'] != null
            ? json['selectedEventId'] as String
            : null,
        selectedEvidenceId: json['selectedEvidenceId'] != null
            ? json['selectedEvidenceId'] as String
            : null);
  }

  Map toJson() => {
        'id': id,
        'selectedEventId': selectedEventId,
        'selectedEvidenceId': selectedEvidenceId,
      };
}
