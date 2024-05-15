import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/client/main.dart';
import 'package:v1/client/widgets/style/Palette.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:provider/provider.dart';
import 'package:v1/common/features/room/RoomsFailArgs.dart';

class RoomsState extends ChangeNotifier {
  Rooms rooms = Rooms(id: 'null', list: []);

  late RoomsClient _client;
  late Palette _pallete;

  late String _roomsSubId;
  late String _errorSubId;

  RoomsState(BuildContext context) {
    _client = Provider.of<RoomsClient>(context, listen: false);
    _pallete = Provider.of<Palette>(context, listen: false);
    _roomsSubId = _client.subRooms(_updateRooms);
    _errorSubId = _client.subError(_onError);
    // subError
    _client.getRooms();
  }

  @override
  void dispose() {
    _client.unsubscribe(_roomsSubId);
    super.dispose();
  }

  void _updateRooms(Rooms r) {
    rooms = r;
    notifyListeners();
  }

  void _onError(RoomsFailArgs e) {
    ScaffoldMessenger.of(scaffoldKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text('Ошибка: ${e.message}'),
        backgroundColor: _pallete.backgroundError,
      ),
    );
  }
}
