import 'package:flutter/material.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';

class EvidenceCard extends StatelessWidget {
  final ScenarioEvedence evedence;
  final VoidCallback? onFlip;
  final bool? isCardCardFlipped;
  final bool? isTransparent;
  final bool? isDisabled;
  final GameCardWidgetSize? size;

  const EvidenceCard(
      {super.key,
      required this.evedence,
      this.isCardCardFlipped,
      this.onFlip,
      this.isDisabled,
      this.isTransparent,
      this.size});

  @override
  Widget build(BuildContext context) {
    return GameCardWidget(
        isCardCardFlipped: isCardCardFlipped,
        onFlip: onFlip,
        isDisabled: isDisabled,
        isTransparent: isTransparent,
        size: size ?? GameCardWidgetSize.S267,
        card: GameCard(
            id: evedence.id,
            title: evedence.title,
            description: evedence.description,
            type: GameCardType.Evidence,
            backBackgroundPath: 'assets/images/evedences-game-card.jpg'));
  }
}
