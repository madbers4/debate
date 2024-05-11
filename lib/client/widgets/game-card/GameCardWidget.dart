import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/client/widgets/game-card/GameCardState.dart';

class GameCardWidget extends StatelessWidget {
  final GameCard card;
  final bool? isCardCardFlipped;
  final bool? isDisabled;

  const GameCardWidget(
      {super.key, required this.card, this.isCardCardFlipped, this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameCardWidgetState>(
        create: (context) => GameCardWidgetState(),
        builder: (context, rre) {
          final state = context.watch<GameCardWidgetState>();

          CardSide cardSide = state.cardSide;

          if (isCardCardFlipped == true) {
            cardSide = CardSide.BACK;
          }

          if (isCardCardFlipped == false) {
            cardSide = CardSide.FRONT;
          }

          final front = Card(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.087 * 1.8,
              width: MediaQuery.of(context).size.width * 0.057 * 1.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(card.frontBackgroundPath != null
                        ? card.frontBackgroundPath!
                        : 'assets/images/game-card-cap.jpg'),
                    fit: BoxFit.fill,
                  )),
              child: Column(
                children: <Widget>[
                  Text(card.title),
                  Text(card.description),
                ],
              ),
            ),
          );

          final back = Card(
            child: Container(
              // 89 x 57
              height: 267,
              width: 171,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(card.frontBackgroundPath != null
                      ? card.frontBackgroundPath!
                      : 'assets/images/game-card.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );

          return Draggable(
            feedback: cardSide == CardSide.FRONT ? front : back,
            childWhenDragging: const SizedBox(height: 267, width: 179),
            child: FlipCard(
                onFlip: state.flip,
                flipOnTouch: isDisabled != true && isCardCardFlipped == null,
                fill: Fill.fillBack,
                direction: FlipDirection.HORIZONTAL,
                side: cardSide,
                front: front,
                back: back),
          );
        });
  }
}
