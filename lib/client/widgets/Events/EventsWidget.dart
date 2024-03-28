import 'package:flutter/material.dart';
import 'package:v1/common/domain/GameCard.dart';
import 'package:v1/client/widgets/GameCard/GameCardWidget.dart';
import 'package:v1/client/widgets/Event/EventCardWidget.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            EventCard(
                name: 'First Event',
                leftCard: GameCardWidget(card: GameCard(id: '1',title: 'СУПЕР КАЙФ', description: 'lorem ipsum')),
                middleCard:GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
                rightCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum'))),
            EventCard(
                name: 'Second Event',
                leftCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
                middleCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
                rightCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            EventCard(
                name: 'Second Event',
                leftCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
                middleCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
                rightCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
            ),
            EventCard(
                name: 'Second Event',
                leftCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
                middleCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
                rightCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
            ),
          ],
        ),
      ],
    );
  }
}
