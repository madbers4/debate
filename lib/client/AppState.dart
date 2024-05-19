import 'dart:async';

import 'package:flutter/material.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/api/ApiClient.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/features/settings/SettingsState.dart';
import 'package:v1/client/main.dart';
import 'package:v1/client/widgets/style/Palette.dart';
import 'package:v1/common/features/autorization/AutorizationToken.dart';
import 'package:v1/common/features/settings/Settings.dart';

class AppState extends ChangeNotifier {
  bool? isUserAutorized;

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
        ScaffoldMessenger.of(scaffoldKey.currentState!.context).showSnackBar(
          SnackBar(
            content: const Text('Ошибка соеденения с сервером'),
            duration: const Duration(minutes: 1),
            backgroundColor: _palette!.backgroundError,
          ),
        );
        router.go('/');
      });

      _apiClient!.subConnect(() {
        if (scaffoldKey.currentState != null) {
          ScaffoldMessenger.of(scaffoldKey.currentState!.context)
              .clearSnackBars();

          ScaffoldMessenger.of(scaffoldKey.currentState!.context).showSnackBar(
            SnackBar(
              content: const Text('Соеденение установлено'),
              duration: const Duration(seconds: 4),
              backgroundColor: _palette!.backgroundSuccess,
            ),
          );
        }

        final settings = _settingsState!.settings;

        if (settings!.authToken != null) {
          Timer(const Duration(seconds: 5), () {
            _authClient!.tokenSignIn(AutorizationToken(
                hash: settings.authToken!, username: settings.username));
          });
        } else {
          if (isUserAutorized == null) {
            Timer(const Duration(seconds: 5), () {
              router.go('/sign-in/right');
            });
          }
        }
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

      _authClient!.subSignInSuccess((args) {
        isUserAutorized = args.isUserAutorized;

        router.go('/rooms/right');

        notifyListeners();
      });
    }
  }

  AppState();
}
