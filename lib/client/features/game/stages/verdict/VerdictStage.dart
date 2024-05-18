import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class VerdictStage extends StatelessWidget {
  const VerdictStage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Stack(
      children: [
        // Выйти
        Center(child: Text('Конец')),
      ],
    );
  }
}
