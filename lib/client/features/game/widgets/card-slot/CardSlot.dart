import 'package:flutter/material.dart';
import 'package:v1/common/GameCard.dart';

class CardSlot extends StatelessWidget {
  final Widget? child;
  final void Function(DragTargetDetails<GameCard>)? onAccept;

  const CardSlot({super.key, this.child, this.onAccept});

  @override
  Widget build(BuildContext context) {
    return DragTarget<GameCard>(
      builder: (context, candidateItems, rejectedItems) {
        return Container(
            height: MediaQuery.of(context).size.width * 0.087 * 1.8,
            width: MediaQuery.of(context).size.width * 0.057 * 1.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: candidateItems.isEmpty
                    ? Border.all(color: Color.fromARGB(255, 228, 148, 95))
                    : Border.all(color: Color.fromARGB(255, 230, 13, 13))),
            child: child ?? Container(),);
      },
      onAcceptWithDetails: onAccept,
    );
  }
}
