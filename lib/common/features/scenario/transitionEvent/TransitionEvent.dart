import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffectFactory.dart';

class TransitionEvent implements DTO {
  final String id;
  final List<TransitionEventEffect> effects;

  TransitionEvent({required this.id, required this.effects});

  TransitionEvent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        effects = List.from(json['evedences'].map<TransitionEventEffect>(
            (json) => TransitionEventEffectFactory(json: json).build()));

  Map toJson() => {'id': id, 'effects': effects.map((e) => e.toJson())};
}
