import 'package:flutter/material.dart';
import 'package:v1/client/features/rooms/table/cells/settings/SettingsCellMenu.dart';

class SettingsCell extends StatelessWidget {
  final String roomId;

  const SettingsCell({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Button
      Container(),
      // CellMenu
      SettingsCellMenu(isShowed: false)
    ]);
  }
}
