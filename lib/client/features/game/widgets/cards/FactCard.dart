import 'package:flutter/material.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';

class FactCard extends StatelessWidget {
  final ScenarioEvent fact;
  final bool? isCardCardFlipped;
  final VoidCallback? onFlip;
  final bool? isDisabled;
  final bool? isHidden;
  final GameCardWidgetSize? size;

  const FactCard(
      {super.key,
      required this.fact,
      this.isCardCardFlipped,
      this.isDisabled,
      this.onFlip,
      this.isHidden,
      this.size});

  @override
  Widget build(BuildContext context) {
    return GameCardWidget(
        isCardCardFlipped: isCardCardFlipped,
        isHidden: isHidden,
        isDisabled: isDisabled,
        size: size ?? GameCardWidgetSize.S267,
        card: GameCard(
            id: fact.id,
            title: fact.title,
            description: fact.description,
            backBackgroundPath: 'assets/images/story-game-card.jpg'));
  }
}
