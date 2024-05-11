import 'package:flutter/material.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/GameCard.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';

class OriginCard extends StatelessWidget {
  final ScenarioDefendantOrigin origin;
  final String title;

  const OriginCard({super.key, required this.origin, required this.title});

  @override
  Widget build(BuildContext context) {
    return GameCardWidget(
        card: GameCard(
      id: origin.id,
      title: title,
      description: origin.description,
    ));
  }
}
