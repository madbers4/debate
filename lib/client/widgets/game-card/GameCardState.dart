import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class GameCardWidgetState extends ChangeNotifier {
  FlipCardController controller = FlipCardController();
  bool isFront;

  GameCardWidgetState({required this.isFront});

  flip(c) {
    isFront = c;
    notifyListeners();
  }
}
