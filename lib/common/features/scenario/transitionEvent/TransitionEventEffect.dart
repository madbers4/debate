import 'package:v1/common/features/game/Game.dart';
import 'package:v1/common/features/infrastructure/dto/DTO.dart';

abstract class TransitionEventEffect implements DTO {
  final String id;

  TransitionEventEffect({
    required this.id,
  });

  Game updateGame(Game game);
}
