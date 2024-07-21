import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';

class TransitionEventChangeActTitleEffect extends TransitionEventEffect {
  String actId;
  String? title;
  String? description;

  TransitionEventChangeActTitleEffect(
      {required super.id, required this.actId, required this.title});

  TransitionEventChangeActTitleEffect.fromJson(Map<String, dynamic> json)
      : actId = json['actId'],
        title = json['title'] != null ? json['title'] as String : null,
        description =
            json['description'] != null ? json['description'] as String : null,
        super(id: json['id']);

  Map toJson() => {
        'id': id,
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
