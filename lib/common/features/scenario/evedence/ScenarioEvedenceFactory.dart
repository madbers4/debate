import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioTruthyEvedence.dart';

class ScenarioEvedenceFactory {
  final Map<dynamic, dynamic> _json;

  ScenarioEvedenceFactory({required Map<dynamic, dynamic> json}) : _json = json;

  ScenarioEvedence build() {
    if (_json['falsyEventIds'] != null) {
      return ScenarioTruthyEvedence.fromJson(_json);
    }

    return ScenarioEvedence.fromJson(_json);
  }
}
