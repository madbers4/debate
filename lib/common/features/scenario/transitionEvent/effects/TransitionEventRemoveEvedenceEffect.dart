import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';

class TransitionEventRemoveEvedenceEffect extends TransitionEventEffect {
  String evedenceId;

  TransitionEventRemoveEvedenceEffect(
      {required super.id, required this.evedenceId});

  TransitionEventRemoveEvedenceEffect.fromJson(Map<String, dynamic> json)
      : evedenceId = json['evedenceId'],
        super(id: json['id']);

  @override
  Map toJson() => {
        'id': id,
        'evedenceId': evedenceId,
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
              .where((e) => e['id'] != evedenceId),
        ]
      }
    });
  }
}
