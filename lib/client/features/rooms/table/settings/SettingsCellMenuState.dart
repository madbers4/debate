import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/common/features/player/Role.dart';
import 'package:v1/common/features/room/JoinRoomArgs.dart';
import 'package:v1/common/features/room/RemoveRoomArgs.dart';

class SettingsCellMenuState extends ChangeNotifier {
  late PlayerRole playerRole;

  late RoomsClient _client;
  late AppState _appState;

  SettingsCellMenuState(BuildContext context) {
    _client = Provider.of<RoomsClient>(context, listen: false);
    _appState = Provider.of<AppState>(context, listen: false);
  }

  void joinAsDefended(String roomId) {
    _client.joinRoom(JoinRoomArgs(roomId: roomId, role: PlayerRole.Defendant));
  }

  void joinAsPlaintiff(String roomId) {
    _client.joinRoom(JoinRoomArgs(roomId: roomId, role: PlayerRole.Plaintiff));
  }

  void joinAsGuest(String roomId) {
    _client.joinRoom(JoinRoomArgs(roomId: roomId, role: PlayerRole.Observer));
  }

  void exitFromRooms() {
    _client.exitFromRooms();
  }

  void removeRoom(String roomId) {
    _client.removeRoom(RemoveRoomArgs(roomId: roomId));
  }
}
