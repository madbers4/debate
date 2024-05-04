import 'package:flutter/material.dart';
import 'package:v1/common/features/settings/Settings.dart';

class SettingsState extends ChangeNotifier {
  Settings settings = Settings();

  SettingsState(BuildContext context);

  save(Settings newSettings) {
    settings = newSettings;
    notifyListeners();
  }
}
