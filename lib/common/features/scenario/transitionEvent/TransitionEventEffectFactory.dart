
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventType.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventAddEvedenceEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventChangeActEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventChangeEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventRemoveEvedenceEffect.dart';

class TransitionEventEffectFactory {
  final Map<String, dynamic> _json;

  TransitionEventEffectFactory({required Map<String, dynamic> json})
      : _json = json;

  TransitionEventEffect build() {
    if (_json['type'] != TransitionEventType.addEvedence) {
      return TransitionEventAddEvedencesEffect.fromJson(_json);
    }
    if (_json['type'] != TransitionEventType.changeAct) {
      return TransitionEventChangeActTitleEffect.fromJson(_json);
    }
    if (_json['type'] != TransitionEventType.changeEvent) {
      return TransitionEventChangeEventEffect.fromJson(_json);
    }
    if (_json['type'] != TransitionEventType.removeEvedence) {
      return TransitionEventRemoveEvedenceEffect.fromJson(_json);
    }

    throw Error();
  }
}
