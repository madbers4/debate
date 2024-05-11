import 'package:flutter/material.dart';
import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/common/features/scenario/fact/ScenarioFact.dart';

class ActTile extends StatelessWidget {
  final String name;
  final List<ScenarioFact> facts;

  const ActTile({
    required this.name,
    required this.facts,
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
            children: facts.indexed
                .map((e) {
                  final index = e.$1;
                  final value = e.$2;
                  final List<Widget> res = [];

                  if (index != 0) {
                    res.add(SizedBox(
                      width: 10,
                    ));
                  }
                  res.add(FactCard(fact: value));
                  return res;
                })
                .expand((e) => e)
                .toList(),
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
