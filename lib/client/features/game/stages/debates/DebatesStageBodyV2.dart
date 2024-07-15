import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStageActTile.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStageDefendantControls.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStageMatchingTile.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStagePlaintiffControls.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

class DebatesStageBodyV2 extends StatelessWidget {
  const DebatesStageBodyV2({super.key});

  @override
  Widget build(BuildContext context) {
    final roomsState = context.watch<RoomsState>();

    return Stack(
      children: [
        const Positioned(
            top: 30,
            left: 30,
            width: 600,
            height: 600,
            child: DebatesStageActTile()),
        const Positioned(
            top: 30,
            right: 30,
            width: 350,
            height: 600,
            child: DebatesStageMatchingTile()),
        Positioned(
            top: 300,
            right: 30,
            width: 350,
            height: 600,
            child: (roomsState.selectedRole is Defendant
                    ? const DebatesStageDefendantControls()
                    : null) ??
                (roomsState.selectedRole is Plaintiff
                    ? const DebatesStagePlaintiffControls()
                    : null) ??
                Container()),
      ],
    );
  }
}