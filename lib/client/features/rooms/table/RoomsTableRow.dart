import 'package:flutter/material.dart';
import 'package:v1/client/features/rooms/table/cells/DefendantCell.dart';
import 'package:v1/client/features/rooms/table/cells/ObserversCell.dart';
import 'package:v1/client/features/rooms/table/cells/PlaintiffCell.dart';
import 'package:v1/client/features/rooms/table/cells/TitleCell.dart';
import 'package:v1/client/features/rooms/table/cells/settings/SettingsCell.dart';

class RoomTableRow extends StatelessWidget {
  final String roomId;
  const RoomTableRow({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TitleCell(title: 'mock'),
        DefendantCell(name: 'mock'),
        PlaintiffCell(name: 'mock'),
        ObserversCell(observersClout: 1),
        SettingsCell(roomId: roomId)
      ],
    );
  }
}
