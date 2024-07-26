import 'package:flutter/material.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/colors.dart';

class GameTitle extends StatelessWidget {
  final String child;
  final double fontSize;
  final TextAlign textAlign;

  const GameTitle(
      {super.key,
      required this.child,
      this.fontSize = 50,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return TransparentPointer(
      child: Text(
        child,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: goldColor, fontFamily: 'Genshin', fontSize: fontSize),
      ),
    );
  }
}
