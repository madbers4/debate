import 'package:flutter/material.dart';
import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/scenario/scenarioDescriptions.dart';

class GamesScreenState extends ChangeNotifier {
  final List<ScenarioDescription> scenarios = scenarioDescriptions;

  GamesScreenState(BuildContext context) {}
}
