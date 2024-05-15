import 'dart:async';

import 'package:flutter/material.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/api/ApiClient.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/features/settings/SettingsState.dart';
import 'package:v1/client/widgets/style/Palette.dart';
import 'package:v1/common/features/autorization/AutorizationToken.dart';
import 'package:v1/common/features/settings/Settings.dart';

class AppState extends ChangeNotifier {
  bool isUserAutorized = false;

  AutorizationClient? _authClient;
  ApiClient? _apiClient;
  SettingsState? _settingsState;
  Palette? _palette;

  setClients(
      BuildContext context,
      Palette palette,
      AutorizationClient authClient,
      ApiClient apiClient,
      SettingsState settingsState) {
    _palette = palette;
    _settingsState = settingsState;

    if (_apiClient != apiClient) {
      _apiClient = apiClient;

      _apiClient!.subConnectError(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Ошибка соеденения с сервером'),
            duration: const Duration(minutes: 1),
            backgroundColor: _palette!.backgroundError,
          ),
        );
        router.go('/');
      });

      _apiClient!.subConnect(() {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Соеденение установлено'),
            duration: const Duration(seconds: 4),
            backgroundColor: _palette!.backgroundSuccess,
          ),
        );

        Timer(const Duration(seconds: 5), () {
          if (isUserAutorized) {
            router.go('/rooms/right');
          } else {
            router.go('/sign-in/right');
          }
        });
      });
    }

    if (_authClient != authClient) {
      _authClient = authClient;

      _authClient!.subToken((token) {
        final settings = _settingsState!.settings;
        _settingsState!.saveSettings(Settings(
            apiHost: settings!.apiHost,
            timeousSec: settings.timeousSec,
            username: settings.username,
            authToken: token.hash));
        notifyListeners();
      });

      _authClient!.subSignInSuccess((token) {
        isUserAutorized = true;
        notifyListeners();
      });

      final settings = _settingsState!.settings;

      if (settings!.authToken != null) {
        _authClient!.tokenSignIn(AutorizationToken(
            hash: settings.authToken!, username: settings.username));
      }
    }
  }

  AppState();
}
