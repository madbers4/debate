import 'package:v1/common/features/scenario/fact/ScenarioFact.dart';
import 'package:v1/common/features/scenario/fact/ScenarioFalsyFact.dart';

class ScenarioFactFactory {
  final Map<String, dynamic> _json;

  ScenarioFactFactory({required Map<String, dynamic> json}) : _json = json;

  ScenarioFact build() {
    if (_json['falsyDescription']) {
      return ScenarioFalsyFact.fromJson(_json);
    }

    return ScenarioFact.fromJson(_json);
  }
}
