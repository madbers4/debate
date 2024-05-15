import 'package:flutter/widgets.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/player/Role.dart';
import 'package:provider/provider.dart';

class CreateRoomState extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String name = '';
  PlayerRole role = PlayerRole.Judge;

  late RoomsClient _client;

  CreateRoomState(BuildContext context) {
    _client = Provider.of<RoomsClient>(context, listen: false);
  }

  create() {
    _client.createRoom(CreateRoomArgs(name: name));
    name = '';
    notifyListeners();
  }

  changeName(String value) {
    name = value;
    notifyListeners();
  }

  changeRole(PlayerRole value) {
    role = value;
    notifyListeners();
  }
}
