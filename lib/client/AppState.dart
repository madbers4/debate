import 'package:flutter/material.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/common/features/autorization/AutorizationToken.dart';

class AppState extends ChangeNotifier {
  AutorizationToken? authToken;
  AutorizationClient authClient;

  AppState(this.authClient) {
    authClient.subToken((token) {
      authToken = token;
      notifyListeners();
    });
  }
}
