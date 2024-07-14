import 'package:flutter/material.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';

class OriginCard extends StatelessWidget {
  final ScenarioDefendantOrigin origin;
  final VoidCallback? onFlip;
  final bool? isCardCardFlipped;
  final bool? isDisabled;
  final GameCardWidgetSize? size;

  const OriginCard(
      {super.key,
      required this.origin,
      this.onFlip,
      this.isCardCardFlipped,
      this.isDisabled,
      this.size});

  @override
  Widget build(BuildContext context) {
    return GameCardWidget(
        onFlip: onFlip,
        isCardCardFlipped: isCardCardFlipped,
        isDisabled: isDisabled,
        size: size ?? GameCardWidgetSize.S267,
        card: GameCard(
            id: origin.id,
            title: origin.title,
            description: origin.description,
            type: GameCardType.Origin,
            backBackgroundPath: 'assets/images/rp-game-card.jpg'));
  }
}
