import 'package:v1/common/features/autorization/SignInFailReason.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';

class SignInFailArgs implements DTO {
  String id = 'null';
  SignInFailReason reason;
  late String message;

  SignInFailArgs({required this.reason}) {
    message = _createMessage();
  }

  static SignInFailArgs fromJson(Map<dynamic, dynamic> json) {
    return SignInFailArgs(reason: SignInFailReason.values.firstWhere((e) => e.toString() == json['reason']));
  }

  Map toJson() => {'id': id, 'reason': reason.toString()};

  String _createMessage() {
    switch (reason) {
      case SignInFailReason.WrongUserOrPassword:
        return 'Не правильный логин или пароль';
      case SignInFailReason.InvalidToken:
        return 'Не верный токен';
      default:
        return 'Unknown Reason';
    }
  }
}
