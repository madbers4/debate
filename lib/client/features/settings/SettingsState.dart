import 'package:flutter/material.dart';
import 'package:v1/client/features/settings/SettingsFields.dart';

class SettingsState extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  // Settings _settings = Settings();
  SettingsFields _fields = SettingsFields();

  SettingsState(BuildContext context);

  SettingsFields getFields() {
    return _fields;
  }

  setFields(SettingsFields newFields) {
    _fields = newFields;
    notifyListeners();
  }
}
