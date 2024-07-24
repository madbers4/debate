import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/event/ScenarioFalsyEvent.dart';

class ScenarioEventFactory {
  final Map<dynamic, dynamic> _json;

  ScenarioEventFactory({required Map<dynamic, dynamic> json}) : _json = json;

  ScenarioEvent build() {
    if (_json['fEvent'] != null) {
      return ScenarioFalsyEvent.fromJson(_json);
    }

    return ScenarioEvent.fromJson(_json);
  }
}
