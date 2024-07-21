import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';

class TransitionEventChangeEventEffect extends TransitionEventEffect {
  String eventId;
  String actId;
  ScenarioEvedence evedence;

  TransitionEventChangeEventEffect(
      {required super.id,
      required this.actId,
      required this.eventId,
      required this.evedence});

  TransitionEventChangeEventEffect.fromJson(Map<String, dynamic> json)
      : eventId = json['eventId'],
        actId = json['actId'],
        evedence = json['evedence'],
        super(id: json['id']);

  @override
  Map toJson() => {
        'id': id,
        'actId': actId,
        'evedence': evedence,
      };

  @override
  Game updateGame(Game game) {
    final json = game.toJson();

    return Game.fromJson({
      ...json,
      'scenario': {
        ...json['scenario'] as Map<dynamic, dynamic>,
        'acts': [
          ...(json['scenario']['acts'] as List<Map<dynamic, dynamic>>)
              .map((act) => act['id'] == actId
                  ? {
                      ...act,
                      [
                        'events'
                      ]: (act['events'] as List<Map<dynamic, dynamic>>).map(
                          (e) => e['id'] == eventId ? evedence.toJson() : e),
                    }
                  : act),
        ]
      }
    });
  }
}
