import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v1/common/features/settings/Settings.dart';

enum Key { apiHost, timeousSec, username, authToken }

class SettingsState extends ChangeNotifier {
  Settings? settings;
  SharedPreferences? _preferences;

  SettingsState() {
    initializePreferences();
  }

  initializePreferences() async {
    _preferences = await SharedPreferences.getInstance();
    _updateSettings();
  }

  void _updateSettings() {
    if (_preferences != null) {
      settings = Settings(
          apiHost: _preferences!.getString(Key.apiHost.toString()) ??
              'http://localhost:3000',
          timeousSec: _preferences!.getInt(Key.timeousSec.toString()) ?? 300,
          username: _preferences!.getString(Key.username.toString()) ?? 'User',
          authToken: _preferences!.getString(Key.authToken.toString()));
      notifyListeners();
    }
  }

  saveSettings(Settings settings) {
    _preferences!.setString(Key.apiHost.toString(), settings.apiHost);
    _preferences!.setInt(Key.timeousSec.toString(), settings.timeousSec);
    _preferences!.setString(Key.username.toString(), settings.username);
    if (settings.authToken != null) {
      _preferences!.setString(Key.authToken.toString(), settings.authToken!);
    } else {
      _preferences!.remove(Key.authToken.toString());
    }
    _updateSettings();
  }
}
