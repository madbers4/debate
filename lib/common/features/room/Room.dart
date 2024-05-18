import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Judge.dart';
import 'package:v1/common/features/player/Observer.dart';
import 'package:v1/common/features/player/Plaintiff.dart';
import 'package:v1/common/features/player/Player.dart';

class Room implements DTO {
  final String id;
  final String name;
  final List<Player> players = [];
  final List<Observer> observers;
  final Plaintiff? plaintiff;
  final Judge? judge;
  final Defendant? defendant;

  Room(
      {required this.id,
      required this.name,
      this.plaintiff,
      this.defendant,
      this.judge,
      this.observers = const []});

  Room.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        plaintiff = json['plaintiff'] != null
            ? Plaintiff.fromJson(json['plaintiff'])
            : null,
        defendant = json['defendant'] != null
            ? Defendant.fromJson(json['defendant'])
            : null,
        judge = json['judge'] != null ? Judge.fromJson(json['judge']) : null,
        observers = json['observers'] != null
            ? List.from(json['observers']
                .map<Observer>((dto) => Observer.fromJson(dto)))
            : [];

  Map toJson() => {
        'id': id,
        'name': name,
        'plaintiff': plaintiff?.toJson(),
        'judge': plaintiff?.toJson(),
        'defendant': defendant?.toJson(),
        'observers': observers.map((e) => e.toJson()).toList()
        // TODO: add observers
      };
}
