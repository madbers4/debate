import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Judge.dart';
import 'package:v1/common/features/player/Observer.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/player/Player.dart';
import 'package:v1/common/features/room/Room.dart';

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

  void join(String roomId, Player player) {
    final room = get(roomId);

    if (room == null) {
      throw Exception('can`t find room, roomId: ${roomId}');
    }

    Defendant? defendant = player is Defendant ? player : room.defendant;
    Judge? judge = player is Judge ? player : room.judge;
    List<Observer> observers =
        player is Observer ? [...room.observers, player] : room.observers;
    Plaintiff? plaintiff = player is Plaintiff ? player : room.plaintiff;

    final updatedRoom = Room(
        id: room.id,
        name: room.name,
        defendant: defendant,
        judge: judge,
        observers: observers,
        plaintiff: plaintiff);

    update(roomId, updatedRoom);
  }

  Room? get(String roomId) {
    final room = _roomById[roomId];

    if (room == null) {
      throw Exception('can`t find room, roomId: ${roomId}');
    }

    return room;
  }

  bool has(String roomId) {
    if (_roomById[roomId] == null) {
      return false;
    }

    return true;
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

    if (room == null) {
      throw Exception('can`t find room, roomId: ${roomId}');
    }

    final roomIndex = _list.indexOf(room);
    _list[roomIndex] = updatedRoom;
    _roomById.update(room.id, (old) => updatedRoom);
  }

  void exitRoom(String roomId, Player player) {
    final room = get(roomId);

    if (room == null) {
      throw Exception('can`t find room, roomId: ${roomId}');
    }

    Defendant? defendant = player is Defendant ? null : room.defendant;
    Judge? judge = player is Judge ? null : room.judge;
    List<Observer> observers = player is Observer
        ? room.observers.where((obs) => obs != player).toList()
        : room.observers;
    Plaintiff? plaintiff = player is Plaintiff ? null : room.plaintiff;

    final updatedRoom = Room(
        id: room.id,
        name: room.name,
        defendant: defendant,
        judge: judge,
        observers: observers,
        plaintiff: plaintiff);

    update(roomId, updatedRoom);
  }
}
