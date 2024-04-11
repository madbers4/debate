import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class SignInArgs implements DTO {
  String id = 'null';
  String username;
  String password;

  SignInArgs({required this.username, required this.password});

  SignInArgs.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        username = json['username'] as String,
        password = json['password'] as String;

  Map toJson() => {'id': id, 'username': username, 'password': password};
}
