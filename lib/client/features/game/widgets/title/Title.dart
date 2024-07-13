import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';

class GameTitle extends StatelessWidget {
  final String child;
  final double fontSize;

  const GameTitle({super.key, required this.child, this.fontSize = 50});

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: goldColor, fontFamily: 'Genshin', fontSize: fontSize),
    );
  }
}
