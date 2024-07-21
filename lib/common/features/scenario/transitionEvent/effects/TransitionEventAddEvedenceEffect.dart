import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';

class TransitionEventAddEvedencesEffect extends TransitionEventEffect {
  List<ScenarioEvedence> evedences;

  TransitionEventAddEvedencesEffect(
      {required super.id, required this.evedences});

  TransitionEventAddEvedencesEffect.fromJson(Map<String, dynamic> json)
      : evedences = List.from(json['evedences']
            .map<ScenarioEvedence>((json) => ScenarioEvedence.fromJson(json))),
        super(id: json['id']);

  @override
  Map toJson() => {
        'type': 'add-evedence',
        'id': id,
        'evedences': evedences.map((e) => e.toJson()),
      };

  @override
  Game updateGame(Game game) {
    final json = game.toJson();

    return Game.fromJson({
      ...json,
      'scenario': {
        ...json['scenario'] as Map<dynamic, dynamic>,
        'evedences': [
          ...json['scenario']['evedences'],
          ...evedences.map((e) => e.toJson())
        ]
      }
    });
  }
}
