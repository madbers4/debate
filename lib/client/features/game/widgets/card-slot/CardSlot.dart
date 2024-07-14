import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/GameCard.dart';

class CardSlot extends StatelessWidget {
  final Widget? child;
  final void Function(DragTargetDetails<GameCard>)? onAccept;
  final GameCardType type;

  const CardSlot({super.key, this.child, required this.type, this.onAccept});

  @override
  Widget build(BuildContext context) {
    return DragTarget<GameCard>(
      builder: (context, candidateItems, rejectedItems) {
        return Container(
          height: heightBySize[GameCardWidgetSize.S267]! + 5,
          width: widthBySize[GameCardWidgetSize.S267]! + 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: candidateItems.isEmpty
                  ? Border.all(color: goldColor)
                  : Border.all(
                      color: candidateItems[0]!.type == type
                          ? const Color.fromARGB(255, 13, 230, 24)
                          : const Color.fromARGB(255, 230, 13, 13))),
          child: child ?? Container(),
        );
      },
      onAcceptWithDetails: onAccept,
    );
  }
}
