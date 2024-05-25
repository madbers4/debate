import 'package:v1/common/features/game/stage-states/GameStageState.dart';

class ActStageState extends GameStageState {
  final bool isCardsShowed;
  final List<String> showedEvidencesIds;

  const ActStageState(
      {super.id = '1',
      this.isCardsShowed = false,
      this.showedEvidencesIds = const []});

  static fromJson(Map<dynamic, dynamic> json) {
    return ActStageState(
        id: json['id'] as String,
        isCardsShowed: json['isDescriptionShowed'] as bool,
        showedEvidencesIds: json['showedEvidencesIds'] != null
            ? List.from(json['showedEvidencesIds'].map<String>((id) => id))
            : []);
  }

  Map toJson() => {
        'id': id,
        'isCardsShowed': isCardsShowed,
        'showedEvidencesIds': showedEvidencesIds
      };
}
