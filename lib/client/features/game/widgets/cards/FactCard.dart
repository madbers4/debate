import 'package:flutter/material.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/scenario/fact/ScenarioFact.dart';

class FactCard extends StatelessWidget {
  final ScenarioFact fact;
  final bool? isCardCardFlipped;
  final VoidCallback? onFlip;
  final bool? isDisabled;

  const FactCard(
      {super.key,
      required this.fact,
      this.isCardCardFlipped,
      this.isDisabled,
      this.onFlip});

  @override
  Widget build(BuildContext context) {
    return GameCardWidget(
        isCardCardFlipped: isCardCardFlipped,
        card: GameCard(
          id: fact.id,
          title: fact.cardType,
          description: fact.description,
        ));
  }
}
