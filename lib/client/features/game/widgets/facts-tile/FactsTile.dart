import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String name;
  final Widget leftCard;
  final Widget middleCard;
  final Widget rightCard;

  const EventCard({
    required this.name,
    required this.leftCard,
    required this.middleCard,
    required this.rightCard,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      height: MediaQuery.of(context).size.width * 0.4 / 1.7,
      width: MediaQuery.of(context).size.width * 0.6 / 1.7,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(name),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [leftCard, middleCard, rightCard],
          )
        ],
      ),
    ));
  }
}



// import 'package:flutter/material.dart';
// import 'package:v1/common/GameCard.dart';
// import 'package:v1/client/widgets/GameCard/GameCardWidget.dart';
// import 'package:v1/client/widgets/event/EventCardWidget.dart';

// class EventsWidget extends StatelessWidget {
//   const EventsWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             EventCard(
//                 name: 'First Event',
//                 leftCard: GameCardWidget(card: GameCard(id: '1',title: 'СУПЕР КАЙФ', description: 'lorem ipsum')),
//                 middleCard:GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
//                 rightCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum'))),
//             EventCard(
//                 name: 'Second Event',
//                 leftCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
//                 middleCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
//                 rightCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
//             )
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             EventCard(
//                 name: 'Second Event',
//                 leftCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
//                 middleCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
//                 rightCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
//             ),
//             EventCard(
//                 name: 'Second Event',
//                 leftCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
//                 middleCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
//                 rightCard: GameCardWidget(card: GameCard(id: '1',title: 'Test Card', description: 'lorem ipsum')),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
