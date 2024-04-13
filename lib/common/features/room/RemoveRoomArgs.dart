import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class RemoveRoomArgs implements DTO {
  String id = 'null';
  String roomId;

  RemoveRoomArgs({required this.roomId});

  RemoveRoomArgs.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        roomId = json['roomId'] as String;

  Map toJson() => {'id': id, 'roomId': roomId.toString()};
}
