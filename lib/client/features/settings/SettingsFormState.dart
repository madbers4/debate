import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/features/settings/SettingsFields.dart';
import 'package:v1/client/features/settings/SettingsState.dart';
import 'package:v1/common/features/settings/Settings.dart';

class SettingsFormState extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  SettingsFields _fields =
      SettingsFields(apiHost: '', timeousSec: 0, username: '');
  late SettingsState _settingsState;

  SettingsFormState(BuildContext context) {
    _settingsState = Provider.of<SettingsState>(context, listen: true);
    if (_settingsState.settings != null) {
      _fields = SettingsFields(
          username: _settingsState.settings!.username,
          apiHost: _settingsState.settings!.apiHost,
          timeousSec: _settingsState.settings!.timeousSec);
    }
  }

  SettingsFields getFields() {
    return _fields;
  }

  setFields(SettingsFields newFields) {
    _fields = newFields;
    notifyListeners();
  }

  save() {
    if (_settingsState.settings != null &&
            _fields.apiHost != _settingsState.settings!.apiHost ||
        _fields.username != _settingsState.settings!.username) {
      Timer(Duration(milliseconds: 100), () {
        Restart.restartApp();
      });
    }

    _settingsState.saveSettings(Settings(
        apiHost: _fields.apiHost,
        timeousSec: _fields.timeousSec,
        username: _fields.username,
        authToken: _settingsState.settings!.authToken));

    notifyListeners();
  }

  logout() {
    _settingsState.saveSettings(Settings(
        apiHost: _settingsState.settings!.apiHost,
        timeousSec: _settingsState.settings!.timeousSec,
        username: _settingsState.settings!.username,
        authToken: null));

    Timer(Duration(milliseconds: 100), () {
      Restart.restartApp();
    });
  }
}
