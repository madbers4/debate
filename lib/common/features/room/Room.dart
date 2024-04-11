import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Observer.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/player/Player.dart';

class Room implements DTO {
  String id;
  String name;
  List<Player> players = [];
  List<Observer> observers;
  Plaintiff? plaintiff;
  Defendant? defendant;

  Room(
      {required this.id,
      required this.name,
      this.plaintiff,
      this.defendant,
      this.observers = const []});

  Room.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        plaintiff = json['plaintiff'] != null
            ? Plaintiff.fromJson(json['plaintiff'])
            : null,
        defendant = json['defendant'] != null
            ? Defendant.fromJson(json['defendant'])
            : null,
        observers = json['observers'] != null
            ? List.from(json['observers']
                .map<Observer>((dto) => Observer.fromJson(dto)))
            : [];

  Map toJson() => {
        'id': id,
        'name': name,
        'plaintiff': plaintiff?.toJson(),
        'defendant': defendant?.toJson()
      };
}
