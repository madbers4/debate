import 'package:flutter/material.dart';
import 'package:v1/client/api/ApiClient.dart';
import 'package:v1/common/domain/Player.dart';

class AppState extends ChangeNotifier {
  ApiClient _client = ApiClient();
  Player? player;

  AppState() {
    _client.subscribe('/', <Player>(p) {
      player = p;
      notifyListeners();
    }, 'player', Player.fromJson);
  }
}
