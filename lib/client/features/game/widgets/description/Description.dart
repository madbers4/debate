import 'package:flutter/material.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/colors.dart';

class GameDescription extends StatelessWidget {
  final String child;
  final double? fontSize;
  final bool? red;

  const GameDescription(
      {super.key, required this.child, this.fontSize, this.red});

  @override
  Widget build(BuildContext context) {
    return TransparentPointer(
      child: Text(
        child,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontFamily: 'Genshin',
            color: red == true ? redColor : whiteColor,
            fontSize: fontSize ?? 20),
      ),
    );
  }
}
