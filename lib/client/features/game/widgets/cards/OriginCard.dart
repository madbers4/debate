import 'package:flutter/material.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';

class OriginCard extends StatelessWidget {
  final ScenarioDefendantOrigin origin;
  final String title;
  final VoidCallback? onFlip;
  final bool? isCardCardFlipped;

  const OriginCard(
      {super.key,
      required this.origin,
      required this.title,
      this.onFlip,
      this.isCardCardFlipped});

  @override
  Widget build(BuildContext context) {
    return GameCardWidget(
        onFlip: onFlip,
        isCardCardFlipped: isCardCardFlipped,
        card: GameCard(
          id: origin.id,
          title: title,
          description: origin.description,
        ));
  }
}
