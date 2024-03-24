import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class GameCardWidgetState extends ChangeNotifier {
  CardSide cardSide = CardSide.FRONT;

  onFlip() {
    if (cardSide == CardSide.FRONT) {
      cardSide = CardSide.BACK;
    } else {
      cardSide = CardSide.FRONT;
    }

    notifyListeners();
  }
}