import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class DebatesStage extends StatelessWidget {
  const DebatesStage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Stack(
      children: [
        // Left Cards
        Container(),
        // Bottom Cards
        Container(),
        // Body
        // Act 1 Tile
        Container(),
        // Act 2 Tile
        Container(),
        // Act 3 Tile
        Container(),
        // Act 4 Tile
        Container(),
        // Center Slots
        // Left CardSlot
        Container(),
        // Right Card Slot
        Container(),
        // Apply
        Container(),
        // Reject
        Container(),
        // End
        Container(),
      ],
    );
  }
}
