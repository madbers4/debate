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
      height: 400,
      width: 600,
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
