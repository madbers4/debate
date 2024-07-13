import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
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
        final appState = context.watch<AppState>();
        final roomsState = context.watch<RoomsState>();
        final room = roomsState.rooms.get(roomId)!;

        return MenuAnchor(
          style: MenuStyle(),
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
            room.defendant == null && appState.isUserAutorized!
                ? MenuItemButton(
                    child: Text('Войти как обвиняемый'),
                    onPressed: () {
                      state.joinAsDefended(roomId);
                    },
                  )
                : Container(),
            room.plaintiff == null && appState.isUserAutorized!
                ? MenuItemButton(
                    child: Text('Войти как прокурор'),
                    onPressed: () {
                      state.joinAsPlaintiff(roomId);
                    },
                  )
                : Container(),
            // MenuItemButton(
            //   child: Text('Войти как наблюдатель'),
            //   onPressed: () {
            //     state.joinAsGuest(roomId);
            //   },
            // ),
            roomsState.selectedRoom?.id == room.id
                ? MenuItemButton(
                    child: Text('Выйти'),
                    onPressed: () {
                      state.exitFromRooms();
                    },
                  )
                : Container(),
            appState.isUserAutorized!
                ? MenuItemButton(
                    child: Text('Удалить'),
                    onPressed: () {
                      state.removeRoom(roomId);
                    },
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
