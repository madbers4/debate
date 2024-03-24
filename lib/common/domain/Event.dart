import 'package:v1/common/domain/Id.dart';

class Event implements Id {
  String id;
  String title;

  Event({required this.id, required this.title});

  Event.fromJson(Map<String, dynamic> json) 
      : id = json['id'] as String,
      title = json['id'] as String;

  Map toJson() => {
      'id': id,
      'title': title
  };
}
