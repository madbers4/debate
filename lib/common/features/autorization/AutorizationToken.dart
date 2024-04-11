import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class AutorizationToken implements DTO {
  String id = 'null';
  String username;
  String hash;

  AutorizationToken({required this.username, required this.hash});

  AutorizationToken.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        username = json['username'] as String,
        hash = json['hash'] as String;

  Map toJson() => {'id': id, 'username': username, 'hash': hash};
}
