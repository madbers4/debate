import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventType.dart';

class TransitionEventChangeEventEffect extends TransitionEventEffect {
  String eventId;
  String actId;
  ScenarioEvent event;

  TransitionEventChangeEventEffect(
      {required super.id,
      required this.actId,
      required this.eventId,
      required this.event});

  TransitionEventChangeEventEffect.fromJson(Map<dynamic, dynamic> json)
      : eventId = json['eventId'],
        actId = json['actId'],
        event = ScenarioEvent.fromJson(json['event']),
        super(id: json['id']);

  @override
  Map toJson() => {
        'type': TransitionEventType.changeEvent,
        'id': id,
        'actId': actId,
        'eventId': eventId,
        'event': event.toJson(),
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
              .map((act) {
            if (act['id'] == actId) {
              return {
                ...act,
                'events':
                    (act['events'] as List<Map<dynamic, dynamic>>).map((e) {
                  if (e['id'] == eventId) {
                    return event.toJson();
                  }

                  return e;
                }),
              };
            }

            return act;
          }),
        ]
      }
    });
  }
}
