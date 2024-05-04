import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/common/features/player/Role.dart';

class SettingsCellMenuState extends ChangeNotifier {
  late PlayerRole playerRole;

  late RoomsClient _client;
  late AppState _appState;

  SettingsCellMenuState(BuildContext context) {
    _client = Provider.of<RoomsClient>(context, listen: false);
    _appState = Provider.of<AppState>(context, listen: false);
  }

  void joinAsDefended() {}
  void joinAsPlaintiff() {}
  void joinAsGuest() {}
  void removeRoom() {}
}
