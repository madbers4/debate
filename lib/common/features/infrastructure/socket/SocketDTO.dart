import 'package:v1/common/features/infrastructure/dto/DTO.dart';

typedef DTOFactory<T extends DTO> = T Function(Map<dynamic, dynamic> json);
typedef ToDTOFactory<T extends DTO> = Map<dynamic, dynamic> Function(T dto);

class SocketBus<T extends DTO> implements DTO {
  Map<dynamic, dynamic> data;
  String id = 'null';
  String path;

  SocketBus(this.data, this.path);

  static SocketBus<T> fromJson<T extends DTO>(Map<String, dynamic> json) {
    return SocketBus(json['data'], json['room']);
  }

  Map toJson() => {'id': id, 'data': data, 'room': path};
}
