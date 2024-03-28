import 'package:v1/common/domain/DTO.dart';

typedef DTOFactory<S> = S Function(Map<dynamic, dynamic> json);

class SocketBus<T extends DTO> implements DTO {
  Map<dynamic, dynamic> data;
  String id = 'null';
  String room;
  String type;

  SocketBus(this.data, this.room, this.type);

  static SocketBus<T> fromJson<T extends DTO>(Map<String, dynamic> json) {
    return SocketBus(json['data'], json['room'], json['type']);
  }

  Map toJson() => {'id': id, 'data': data, 'room': room, 'type': type};
}
