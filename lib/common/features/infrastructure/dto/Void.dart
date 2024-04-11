import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class Void implements DTO {
  String id = 'null';

  Void();

  Void.fromJson(Map<dynamic, dynamic> json) : id = json['id'] as String;

  Map toJson() => {
        'id': id,
      };
}
