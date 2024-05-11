import 'package:flutter/material.dart';

class CardSlot extends StatelessWidget {
  const CardSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width * 0.087 * 1.8,
        width: MediaQuery.of(context).size.width * 0.057 * 1.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromARGB(255, 228, 148, 95))
        ),
        child: Container());
  }
}
