import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/client/widgets/game-card/GameCardState.dart';

enum GameCardWidgetSize { S267, S221 }

const Map<GameCardWidgetSize, double> heightBySize = {
  GameCardWidgetSize.S221: 212.16,
  GameCardWidgetSize.S267: 256.32,
};

const Map<GameCardWidgetSize, double> widthBySize = {
  GameCardWidgetSize.S221: 136.2528,
  GameCardWidgetSize.S267: 164.16,
};

const Map<GameCardWidgetSize, double> titleSizeBySize = {
  GameCardWidgetSize.S221: 14,
  GameCardWidgetSize.S267: 15,
};

const Map<GameCardWidgetSize, double> descriptionSizeBySize = {
  GameCardWidgetSize.S221: 11,
  GameCardWidgetSize.S267: 12,
};

class GameCardWidget extends StatelessWidget {
  final GameCard card;
  final bool? isCardCardFlipped;
  final bool? isDisabled;
  final bool? isHightlighted;
  final bool? isTransparent;
  final bool? fullTransparent;
  final VoidCallback? onFlip;
  final GameCardWidgetSize size;

  const GameCardWidget(
      {super.key,
      required this.card,
      this.isCardCardFlipped,
      this.isDisabled,
      this.isHightlighted,
      this.isTransparent,
      this.fullTransparent,
      this.onFlip,
      this.size = GameCardWidgetSize.S267});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameCardWidgetState>(
        create: (context) => GameCardWidgetState(
            isFront: isCardCardFlipped != null ? !isCardCardFlipped! : true),
        builder: (context, rre) {
          final transparentSize = fullTransparent == true ? 0.0 : 0.5;
          final cardWidth = widthBySize[size];
          final cardHeight = heightBySize[size];
          final titleSize = titleSizeBySize[size];
          final descriptionSize = descriptionSizeBySize[size];

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

          CardSide cardSide = state.isFront ? CardSide.FRONT : CardSide.BACK;

          if (isCardCardFlipped == true) {
            cardSide = CardSide.BACK;
            state.isFront = false;
          }

          if (isCardCardFlipped == false) {
            cardSide = CardSide.FRONT;
            state.isFront = true;
          }

          final front = AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isTransparent == true ? transparentSize : 1.0,
            child: Card(
              child: Container(
                height: cardHeight,
                width: cardWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(card.frontBackgroundPath != null
                          ? card.frontBackgroundPath!
                          : 'assets/images/game-card-front.jpg'),
                      fit: BoxFit.fill,
                    )),
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(
                          top: 12, left: 7, right: 7, bottom: 4),
                      child: Text(
                        card.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: blueColor,
                            fontSize: titleSize,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Genshin'),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                            top: 12, left: 12, right: 12, bottom: 12),
                        child: Text(
                          card.description,
                          style: TextStyle(
                              fontSize: descriptionSize,
                              color: const Color.fromARGB(255, 38, 59, 71),
                              fontFamily: 'Genshin',
                              letterSpacing: 0.01,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
            ),
          );

          final back = AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isTransparent == true ? transparentSize : 1.0,
            child: Card(
              child: Container(
                // 89 x 57
                height: cardHeight,
                width: cardWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(card.backBackgroundPath != null
                        ? card.backBackgroundPath!
                        : 'assets/images/game-card.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );

          return Draggable<GameCard>(
            data: card,
            maxSimultaneousDrags: isDisabled == true ? 0 : null,
            feedback: cardSide == CardSide.FRONT ? front : back,
            childWhenDragging: Opacity(
                opacity: transparentSize,
                child: cardSide == CardSide.FRONT ? front : back),
            child: GestureDetector(
              onTap: isDisabled != true
                  ? () {
                      if (isDisabled == true) {
                        return;
                      }
                      if (onFlip != null) {
                        onFlip!();
                      }

                      if (isCardCardFlipped == null) {
                        state.flip(!state.controller.state!.isFront);

                        state.controller.toggleCard();
                      }
                    }
                  : null,
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
