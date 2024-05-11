import 'package:flutter/material.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';

class EvidenceCard extends StatelessWidget {
  final ScenarioEvedence evedence;
  final bool? isCardCardFlipped;

  const EvidenceCard(
      {super.key, required this.evedence, this.isCardCardFlipped});

  @override
  Widget build(BuildContext context) {
    return GameCardWidget(
        isCardCardFlipped: isCardCardFlipped,
        card: GameCard(
          id: evedence.id,
          title: evedence.title,
          description: evedence.description,
        ));
  }
}
