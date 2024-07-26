import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffectFactory.dart';

class TransitionEvent implements DTO {
  final String id;
  final bool? afterNoEvedenceLeft;
  final bool? endGame;
  final List<TransitionEventEffect> effects;

  TransitionEvent(
      {required this.id,
      required this.effects,
      this.afterNoEvedenceLeft,
      this.endGame});

  TransitionEvent.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        afterNoEvedenceLeft = json['afterNoEvedenceLeft'],
        endGame = json['endGame'],
        effects = List.from(json['effects'].map<TransitionEventEffect>(
            (json) => TransitionEventEffectFactory(json: json).build()));

  Map toJson() => {
        'id': id,
        'afterNoEvedenceLeft': afterNoEvedenceLeft,
        'endGame': endGame,
        'effects': effects.map((e) => e.toJson()).toList()
      };
}
