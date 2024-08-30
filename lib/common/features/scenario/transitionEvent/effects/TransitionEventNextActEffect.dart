import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventType.dart';

class TransitionEventNextActEffect extends TransitionEventEffect {

  TransitionEventNextActEffect(
      {required super.id});

  TransitionEventNextActEffect.fromJson(Map<dynamic, dynamic> json)
      : 
        super(id: json['id']);

  Map toJson() => {
        'type': TransitionEventType.changeAct,
        'id': id,
      };

  Game updateGame(Game game) {
    return game;
  }
}
