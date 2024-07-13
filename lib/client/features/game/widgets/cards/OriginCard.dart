import 'package:flutter/material.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';

class OriginCard extends StatelessWidget {
  final ScenarioDefendantOrigin origin;
  final VoidCallback? onFlip;
  final bool? isCardCardFlipped;
  final bool? isDisabled;

  const OriginCard(
      {super.key,
      required this.origin,
      this.onFlip,
      this.isCardCardFlipped,
      this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return GameCardWidget(
        onFlip: onFlip,
        isCardCardFlipped: isCardCardFlipped,
        isDisabled: isDisabled,
        card: GameCard(
            id: origin.id,
            title: origin.title,
            description: origin.description,
            backBackgroundPath: 'assets/images/rp-game-card.jpg'));
  }
}
