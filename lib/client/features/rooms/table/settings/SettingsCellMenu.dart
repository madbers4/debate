import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/rooms/table/settings/SettingsCellMenuState.dart';

class SettingsCellMenu extends StatelessWidget {
  final bool isShowed;

  const SettingsCellMenu({super.key, required this.isShowed});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SettingsCellMenuState(context),
        builder: (context, child) {
          final state = context.watch<SettingsCellMenuState>();

          // Popup
          return Stack(children: [
            // JoinAs Plaitiff
            Container(),
            // Join As Defendent
            Container(),
            // Join As Guest
            Container(),
            // Delete Room
            Container()
          ]);
        });
  }
}
