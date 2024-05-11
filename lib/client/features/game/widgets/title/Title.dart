import 'package:flutter/material.dart';

class GameTitle extends StatelessWidget {
  final String child;

  const GameTitle({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
