import 'package:v1/common/features/game/stage-states/GameStageState.dart';

class EvidencesStageState extends GameStageState {
  final bool isCardsShowed;
  final List<String> showedEvidencesIds;

  const EvidencesStageState(
      {super.id = '1',
      this.isCardsShowed = false,
      this.showedEvidencesIds = const []});

  static fromJson(Map<dynamic, dynamic> json) {
    return EvidencesStageState(
        id: json['id'] as String,
        isCardsShowed: json['isCardsShowed'] as bool,
        showedEvidencesIds: json['showedEvidencesIds'] != null
            ? List.from(json['showedEvidencesIds'])
            : []);
  }

  Map toJson() => {
        'id': id,
        'isCardsShowed': isCardsShowed,
        'showedEvidencesIds': showedEvidencesIds
      };
}
