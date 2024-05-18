import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/client/main.dart';
import 'package:v1/client/widgets/style/Palette.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';
import 'package:v1/common/features/player/Player.dart';
import 'package:v1/common/features/room/Room.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:provider/provider.dart';
import 'package:v1/common/features/room/RoomsFailArgs.dart';

class RoomsState extends ChangeNotifier {
  Rooms rooms = Rooms(id: 'null', list: []);
  Room? selectedRoom;
  Player? selectedRole;

  RoomsClient? _client;
  Palette? _pallete;

  String? _roomsSubId;
  String? _selectedRoomSubId;
  String? _selectedRoleSubIdRemove;
  String? _selectedRoleSubId;
  String? _selectedRoomSubIdRemove;
  String? _errorSubId;

  RoomsState();

  setClients(BuildContext context) {
    _client = Provider.of<RoomsClient>(context, listen: false);
    _pallete = Provider.of<Palette>(context, listen: false);
    _roomsSubId = _client!.subRooms(_updateRooms);
    _selectedRoomSubId = _client!.subSelectedRoom(_updateSelectedRoom);
    _selectedRoleSubId = _client!.subSelectedRole(_updateSelectedRole);
    _selectedRoleSubIdRemove =
        _client!.subSelectedRoleRemove(_removeSelectedRole);
    _selectedRoomSubIdRemove =
        _client!.subSelectedRoomRemove(_removeSelectedRoom);
    _errorSubId = _client!.subError(_onError);
  }

  @override
  void dispose() {
    _client!.unsubscribe(_roomsSubId!);
    _client!.unsubscribe(_errorSubId!);
    _client!.unsubscribe(_selectedRoomSubId!);
    _client!.unsubscribe(_selectedRoleSubIdRemove!);
    _client!.unsubscribe(_selectedRoleSubId!);
    _client!.unsubscribe(_selectedRoomSubIdRemove!);
    super.dispose();
  }

  void _updateRooms(Rooms r) {
    rooms = r;
    notifyListeners();
  }

  void _updateSelectedRole(Player r) {
    selectedRole = r;
    notifyListeners();
  }

  void _updateSelectedRoom(Room r) {
    selectedRoom = r;
    notifyListeners();
  }

  void _removeSelectedRole(Void _) {
    selectedRole = null;
    notifyListeners();
  }

  void _removeSelectedRoom(Void _) {
    selectedRoom = null;
    notifyListeners();
  }

  void _onError(RoomsFailArgs e) {
    ScaffoldMessenger.of(scaffoldKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text('Ошибка: ${e.message}'),
        backgroundColor: _pallete!.backgroundError,
      ),
    );
  }
}
