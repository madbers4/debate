import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Judge.dart';
import 'package:v1/common/features/player/Observer.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/player/Role.dart';
import 'package:v1/common/features/room/Room.dart';
import 'package:v1/common/utils/generateUID.dart';

class Rooms implements DTO {
  String id;
  List<Room> _list = [];
  Map<String, Room> _roomById = {};

  Rooms({required this.id, required List<Room> list}) {
    for (final room in list) {
      add(room);
    }
  }

  Rooms.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        _list =
            List.from(json['rooms'].map<Room>((room) => Room.fromJson(room)));

  Map toJson() => {'id': id, 'rooms': _list};

  void add(Room room) {
    _list.add(room);

    _roomById[room.id] = room;
  }

  List<Room> getAll() {
    return _list;
  }

  void join(String roomId, String name, Role role) {
    final room = get(roomId);

    Defendant? defendant = room.defendant;
    Judge? judge = room.judge;
    List<Observer> observers = room.observers;
    Plaintiff? plaintiff = room.plaintiff;

    switch (role) {
      case Role.Defendant:
        defendant = Defendant(id: generateUID(), name: name);
        break;
      case Role.Judge:
        judge = Judge(id: generateUID(), name: name);
        break;
      case Role.Observer:
        observers.add(Observer(id: generateUID(), name: name));
        break;
      case Role.Plaintiff:
        plaintiff = Plaintiff(id: generateUID(), name: name);
        break;
      default:
        throw Exception('can`t find role: ${role.toString()}');
    }

    final updatedRoom = Room(
        id: room.id,
        name: room.name,
        defendant: defendant,
        judge: judge,
        observers: observers,
        plaintiff: plaintiff);

    update(roomId, updatedRoom);
  }

  Room get(String roomId) {
    final room = _roomById[roomId];

    if (room == null) {
      throw Exception('can`t find room, roomId: ${roomId}');
    }

    return room;
  }

  void remove(String roomId) {
    final room = get(roomId);

    _list.remove(room);
    _roomById.remove(roomId);
  }

  void update(String roomId, Room updatedRoom) {
    if (roomId != updatedRoom.id) {
      throw Exception('can`t update room, roomId don`t match updatedRoom.id');
    }
    final room = get(roomId);
    final roomIndex = _list.indexOf(room);
    _list[roomIndex] = updatedRoom;
    _roomById.update(room.id, (old) => updatedRoom);
  }
}
