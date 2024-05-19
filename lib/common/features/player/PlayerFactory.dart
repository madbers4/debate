import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Judge.dart';
import 'package:v1/common/features/player/Observer.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/player/Player.dart';

class PlayerFactory {
  PlayerFactory();

  static Player fromJson(Map<dynamic, dynamic> json) {
    if (json['type'] == 'plaintiff') {
      return Plaintiff.fromJson(json['data']);
    }

    if (json['type'] == 'defendant') {
      return Defendant.fromJson(json['data']);
    }

    if (json['type'] == 'judge') {
      return Judge.fromJson(json['data']);
    }

    if (json['type'] == 'observer') {
      return Observer.fromJson(json['data']);
    }

    return Player.fromJson(json['data']);
  }

  static Map toJson(Player player) {
    if (player is Plaintiff) {
      return {'type': 'plaintiff', 'data': player.toJson()};
    }

    if (player is Defendant) {
      return {'type': 'defendant', 'data': player.toJson()};
    }

    if (player is Judge) {
      return {'type': 'judge', 'data': player.toJson()};
    }

    if (player is Observer) {
      return {'type': 'observer', 'data': player.toJson()};
    }

    return {'type': 'default', 'data': player.toJson()};
  }
}
