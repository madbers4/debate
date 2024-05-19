import 'package:flutter/material.dart';
import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/scenario/scenarioDescriptions.dart';

class ScenarionScreenState extends ChangeNotifier {
  String? selectedScenarioId;
  bool hasSelectAccess = true;
  final List<ScenarioDescription> scenarios = scenarioDescriptions;

  ScenarionScreenState(BuildContext context);

  select(String? id) {
    selectedScenarioId = id;
    notifyListeners();
  }
}
