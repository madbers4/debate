import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/api/ApiClient.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/widgets/style/Palette.dart';
import 'package:v1/common/features/autorization/AutorizationToken.dart';

class AppState extends ChangeNotifier {
  AutorizationToken? authToken =
      AutorizationToken(username: 'Furina', hash: 'dfoigfdgjsjgfsgdjf');
  bool isUserAutorized = false;

  late AutorizationClient _authClient;
  late ApiClient _apiClient;

  AppState(BuildContext context) {
    final palette = Provider.of<Palette>(context, listen: false);
    _authClient = Provider.of<AutorizationClient>(context, listen: false);
    _apiClient = Provider.of<ApiClient>(context, listen: false);

    _apiClient.subConnectError(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка соеденения с сервером'),
          backgroundColor: palette.backgroundError,
        ),
      );
    });

    _authClient.subToken((token) {
      authToken = token;
      notifyListeners();
    });

    _authClient.subSignInSuccess((token) {
      isUserAutorized = true;
      notifyListeners();
    });
  }
}
