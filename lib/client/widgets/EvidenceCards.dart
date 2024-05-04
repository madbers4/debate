import 'package:flutter/material.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';

class EvidencesCards extends StatelessWidget {
  const EvidencesCards();

  @override
  Widget build(BuildContext context) {
    final card = GameCardWidget(
        card: GameCard(id: '1', title: 'Test Card', description: 'lorem ipsum'));

    return Container(
      height: 400,
      color: Colors.transparent,
      width: 600,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [card, card, card, card, card, card, card],
      ),
    );
  }
}
