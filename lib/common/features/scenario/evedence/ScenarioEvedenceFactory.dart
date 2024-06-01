import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioFalsyEvedence.dart';

class ScenarioEvedenceFactory {
  final Map<String, dynamic> _json;

  ScenarioEvedenceFactory({required Map<String, dynamic> json}) : _json = json;

  ScenarioEvedence build() {
    if (_json['falsyEventId'] != null) {
      return ScenarioTruthyEvedence.fromJson(_json);
    }

    return ScenarioEvedence.fromJson(_json);
  }
}
