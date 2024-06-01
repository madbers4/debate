import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/client/widgets/game-card/GameCardState.dart';

class GameCardWidget extends StatelessWidget {
  final GameCard card;
  final bool? isCardCardFlipped;
  final bool? isDisabled;
  final bool? isHightlighted;
  final bool? isHidden;
  final VoidCallback? onFlip;

  const GameCardWidget(
      {super.key,
      required this.card,
      this.isCardCardFlipped,
      this.isDisabled,
      this.isHightlighted,
      this.isHidden,
      this.onFlip});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameCardWidgetState>(
        create: (context) => GameCardWidgetState(),
        builder: (context, rre) {
          final state = context.watch<GameCardWidgetState>();

          if (isCardCardFlipped != null &&
              state.controller.state?.isFront == isCardCardFlipped) {
            state.controller.toggleCard();
          }

          if (isCardCardFlipped != null &&
              isCardCardFlipped != null &&
              state.controller.state != null &&
              !state.controller.state!.isFront == !isCardCardFlipped!) {
            state.controller.toggleCard();
          }

          CardSide cardSide = state.controller.state?.isFront ?? true
              ? CardSide.FRONT
              : CardSide.BACK;

          if (isCardCardFlipped == true) {
            cardSide = CardSide.BACK;
          }

          if (isCardCardFlipped == false) {
            cardSide = CardSide.FRONT;
          }

          // if (state.controller.state?.isFront == isCardCardFlipped) {
          //   state.controller.toggleCard();
          // }

          final front = Visibility(
            visible: isHidden == true ? false : true,
            child: Card(
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
            ),
          );

          final back = Visibility(
            visible: isHidden == true ? false : true,
            child: Card(
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
            ),
          );

          if (isDisabled == true) {
            return FlipCard(
                side: cardSide,
                flipOnTouch: false,
                fill: Fill.fillBack,
                direction: FlipDirection.HORIZONTAL,
                controller: state.controller,
                front: front,
                back: back);
          }

          return Draggable<GameCard>(
            data: card,
            feedback: cardSide == CardSide.FRONT ? front : back,
            childWhenDragging: const SizedBox(height: 267, width: 179),
            child: GestureDetector(
              onTap: () {
                if (isDisabled == true) {
                  return;
                }
                if (onFlip != null) {
                  onFlip!();
                }

                if (isCardCardFlipped == null) {
                  state.controller.toggleCard();
                }
              },
              child: FlipCard(
                  side: cardSide,
                  flipOnTouch: false,
                  fill: Fill.fillBack,
                  direction: FlipDirection.HORIZONTAL,
                  controller: state.controller,
                  front: front,
                  back: back),
            ),
          );
        });
  }
}
