import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioTruthyEvedence.dart';

class ScenarioEvedenceFactory {
  final Map<String, dynamic> _json;

  ScenarioEvedenceFactory({required Map<String, dynamic> json}) : _json = json;

  ScenarioEvedence build() {
    if (_json['falsyFactId']) {
      return ScenarioTruthyEvedence.fromJson(_json);
    }

    return ScenarioEvedence.fromJson(_json);
  }
}
