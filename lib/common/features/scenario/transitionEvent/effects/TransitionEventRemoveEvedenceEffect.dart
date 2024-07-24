import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventType.dart';

class TransitionEventRemoveEvedenceEffect extends TransitionEventEffect {
  List<String> evedenceIds;

  TransitionEventRemoveEvedenceEffect(
      {required super.id, required this.evedenceIds});

  TransitionEventRemoveEvedenceEffect.fromJson(Map<dynamic, dynamic> json)
      : evedenceIds = (json['evedenceIds'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        super(id: json['id']);

  @override
  Map toJson() => {
        'type': TransitionEventType.removeEvedence,
        'id': id,
        'evedenceIds': evedenceIds.toList(),
      };

  @override
  Game updateGame(Game game) {
    final json = game.toJson();

    return Game.fromJson({
      ...json,
      'scenario': {
        ...json['scenario'] as Map<dynamic, dynamic>,
        'evedences': [
          ...(json['scenario']['evedences'] as List<Map<dynamic, dynamic>>)
              .where((e) => !evedenceIds.any((element) => e['id'] == element))
              .toList(),
        ]
      }
    });
  }

  List<ScenarioEvedence> getWillRemovedEvedences(Game game) {
    return game.scenario.evedences
        .where((e) => evedenceIds.any((element) => e.id == element))
        .toList();
  }
}
