import 'package:flutter/widgets.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/common/features/room/Rooms.dart';
import 'package:provider/provider.dart';

class RoomsState extends ChangeNotifier {
  Rooms rooms = Rooms(id: 'null', list: []);

  late RoomsClient _client;

  late String _roomsSubId;

  RoomsState(BuildContext context) {
    _client = Provider.of<RoomsClient>(context, listen: false);
    _roomsSubId = _client.subRooms(_updateRooms);
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
}
