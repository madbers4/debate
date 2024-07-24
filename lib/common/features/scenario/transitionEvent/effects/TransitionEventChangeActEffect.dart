import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventType.dart';

class TransitionEventChangeActEffect extends TransitionEventEffect {
  String actId;
  String? title;
  String? description;

  TransitionEventChangeActEffect(
      {required super.id, required this.actId, this.title, this.description});

  TransitionEventChangeActEffect.fromJson(Map<dynamic, dynamic> json)
      : actId = json['actId'],
        title = json['title'] != null ? json['title'] as String : null,
        description =
            json['description'] != null ? json['description'] as String : null,
        super(id: json['id']);

  Map toJson() => {
        'type': TransitionEventType.changeAct,
        'id': id,
        'actId': actId,
        'title': title,
        'description': description,
      };

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
                      title: title ?? act['title'],
                      description: description ?? act['description']
                    }
                  : act),
        ]
      }
    });
  }
}
