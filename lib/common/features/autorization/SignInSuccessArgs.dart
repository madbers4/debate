import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class SignInSuccessArgs implements DTO {
  String id = 'null';
  bool isUserAutorized;

  SignInSuccessArgs({required this.isUserAutorized});

  SignInSuccessArgs.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        isUserAutorized = json['isUserAutorized'] as bool;

  Map toJson() => {'id': id, 'isUserAutorized': isUserAutorized};
}
