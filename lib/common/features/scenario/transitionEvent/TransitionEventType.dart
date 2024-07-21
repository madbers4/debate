import 'package:v1/common/features/infrastructure/dto/DTO.dart';

abstract class TransitionEventType implements DTO {
  static const String addEvedence = 'addEvedence';
  static const String changeAct = 'changeAct';
  static const String changeEvent = 'changeEvent';
  static const String removeEvedence = 'removeEvedence';
}
