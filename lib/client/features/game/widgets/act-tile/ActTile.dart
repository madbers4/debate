import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';

class ActTile extends StatelessWidget {
  final String actId;
  final ScenarioAct event;
  final List<String> hiddenIds;

  const ActTile(
      {required this.actId, required this.event, required this.hiddenIds});

  @override
  Widget build(BuildContext context) {
    final roomsState = context.watch<RoomsState>();

    return Card(
        child: Container(
      height: 300,
      width: 500,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(event.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: event.events.indexed
                .map((e) {
                  final index = e.$1;
                  final value = e.$2;
                  final List<Widget> res = [];

                  if (index != 0) {
                    res.add(const SizedBox(
                      width: 10,
                    ));
                  }
                  res.add(FactCard(
                    fact: value,
                    isHidden: hiddenIds.any((element) => element == value.id),
                    isDisabled: roomsState.selectedRole is! Defendant,
                  ));
                  return res;
                })
                .expand((e) => e)
                .toList(),
          )
        ],
      ),
    ));
  }
}
