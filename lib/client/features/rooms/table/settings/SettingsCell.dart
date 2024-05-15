import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/rooms/table/settings/SettingsCellMenuState.dart';

class RowSettingsMenuButton extends StatelessWidget {
  final String roomId;

  const RowSettingsMenuButton({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsCellMenuState(context),
      builder: (context, child) {
        final state = context.watch<SettingsCellMenuState>();

        return MenuAnchor(
          builder: (BuildContext context, MenuController controller,
                  Widget? child) =>
              IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Actions',
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
          ),
          menuChildren: [
            MenuItemButton(
              child: Text('Войти как обвиняемый'),
              onPressed: () {
                state.joinAsDefended(roomId);
              },
            ),
            MenuItemButton(
              child: Text('Войти как прокурор'),
              onPressed: () {
                state.joinAsPlaintiff(roomId);
              },
            ),
            MenuItemButton(
              child: Text('Войти как смотритель'),
              onPressed: () {
                state.joinAsGuest(roomId);
              },
            ),
            MenuItemButton(
              child: Text('Выйти'),
              onPressed: () {
                state.exitFromRooms();
              },
            ),
            MenuItemButton(
              child: Text('Удалить'),
              onPressed: () {
                state.removeRoom(roomId);
              },
            ),
          ],
        );
      },
    );
  }
}
