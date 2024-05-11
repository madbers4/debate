import 'package:flutter/material.dart';

class GameDescription extends StatelessWidget {
  final String child;

  const GameDescription({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
