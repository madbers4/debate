import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/room/Room.dart';

class Rooms implements DTO {
  String id;
  List<Room> list;

  Rooms({required this.id, required this.list});

  Rooms.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        list =
            List.from(json['rooms'].map<Room>((room) => Room.fromJson(room)));

  Map toJson() => {'id': id, 'rooms': list};
}
