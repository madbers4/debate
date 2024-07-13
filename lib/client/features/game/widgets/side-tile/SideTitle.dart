import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';

class SideTitle extends StatelessWidget {
  final String title;

  const SideTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(fontFamily: 'Genshin', color: goldColor),
    );
  }
}
