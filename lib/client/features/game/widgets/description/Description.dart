import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';

class GameDescription extends StatelessWidget {
  final String child;

  const GameDescription({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontFamily: 'Genshin', color: whiteColor, fontSize: 20),
    );
  }
}
