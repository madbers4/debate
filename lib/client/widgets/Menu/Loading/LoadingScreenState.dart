import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/api/AutorizationClient.dart';

class LoadingScreenState extends ChangeNotifier {
  LoadingScreenState(BuildContext context) {
    final authClient = Provider.of<AutorizationClient>(context, listen: false);
    final appState = Provider.of<AppState>(context, listen: false);

    if (!appState.isUserAutorized) {
      if (appState.authToken != null) {
        authClient.tokenSignIn(appState.authToken!);

        Timer(Duration(seconds: 2), () {
          if (appState.isUserAutorized) {
            context.go('/');
          } else {
            context.go('/sign-in');
          }
        });
      } else {
        Timer(Duration(seconds: 2), () {
          context.go('/sign-in');
        });
      }
    } else {
      Timer(Duration(seconds: 2), () {
        context.go('/');
      });
    }
  }
}
