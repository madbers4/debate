import 'package:flutter/widgets.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/common/features/room/Rooms.dart';

class RoomsState extends ChangeNotifier {
  Rooms rooms = Rooms(id: 'null', list: []);

  RoomsClient _client;

  late String _roomsSubId;

  RoomsState(this._client) {
    _roomsSubId = _client.subRooms(_updateRooms);
    _client.getRooms();
  }

  void _updateRooms(Rooms r) {
    rooms = r;
    notifyListeners();
  }

  @override
  void dispose() {
    _client.unsubscribe(_roomsSubId);
    super.dispose();
  }
}
