import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/room/RoomsFailReason.dart';

class RoomsFailArgs implements DTO {
  String id = 'null';
  RoomsFailReason reason;
  late String message;

  RoomsFailArgs({required this.reason}) {
    message = _createMessage();
  }

  static RoomsFailArgs fromJson(Map<dynamic, dynamic> json) {
    return RoomsFailArgs(
        reason: RoomsFailReason.values
            .firstWhere((e) => e.toString() == json['reason']));
  }

  Map toJson() => {'id': id, 'reason': reason.toString()};

  String _createMessage() {
    switch (reason) {
      case RoomsFailReason.TheDefenderAlreadyExists:
        return 'Обвиняемый уже существует';
      case RoomsFailReason.ThePlainriffAlreadyExists:
        return 'Прокурор уже существует';
      case RoomsFailReason.TooMuchObservers:
        return 'Невозможно назначить больше 1000 смотрителей';
      case RoomsFailReason.TooMuchRooms:
        return 'Невозможно создать больше 10 комнат';
      case RoomsFailReason.TheRoomWithThisNameAlreadyExists:
        return 'Комната с таким именем уже существует';
      default:
        return 'Unknown Reason';
    }
  }
}
