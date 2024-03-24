import 'package:flutter/material.dart';
import 'package:v1/common/domain/GameCard.dart';
import 'package:v1/client/widgets/GameCard/GameCardWidget.dart';

class RPCards extends StatelessWidget {
  const RPCards();

  @override
  Widget build(BuildContext context) {
    final card = GameCardWidget(
        card: GameCard(id: '1', title: 'Test Card', description: 'lorem ipsum'));

    return Container(
      height: 400,
      color: Colors.transparent,
      width: 180,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [card, card, card],
      ));
  }
}
