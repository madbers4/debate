import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffectFactory.dart';

class TransitionEvent implements DTO {
  final String id;
  final bool? afterNoEvedenceLeft;
  final List<TransitionEventEffect> effects;

  TransitionEvent(
      {required this.id, required this.effects, this.afterNoEvedenceLeft});

  TransitionEvent.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        afterNoEvedenceLeft = json['afterNoEvedenceLeft'],
        effects = List.from(json['effects'].map<TransitionEventEffect>(
            (json) => TransitionEventEffectFactory(json: json).build()));

  Map toJson() => {
        'id': id,
        'afterNoEvedenceLeft': afterNoEvedenceLeft,
        'effects': effects.map((e) => e.toJson()).toList()
      };
}
