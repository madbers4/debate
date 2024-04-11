import 'package:flutter/widgets.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/common/features/room/CreateRoomArgs.dart';
import 'package:v1/common/features/player/Role.dart';

class CreateRoomState extends ChangeNotifier {
  RoomsClient _client;
  final formKey = GlobalKey<FormState>();

  String _name = '';
  Role _role = Role.Judge;

  CreateRoomState(this._client) {}

  create() {
    _client.createRoom(CreateRoomArgs(name: _name, role: _role));
    formKey.currentState!.reset();
  }

  String getName() {
    return _name;
  }

  Role getRole() {
    return _role;
  }

  changeName(String _value) {
    _name = _value;
    notifyListeners();
  }

  changeRole(Role value) {
    _role = value;
    notifyListeners();
  }
}
