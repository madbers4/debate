import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/rooms/table/settings/SettingsCell.dart';
import 'package:v1/common/features/room/Room.dart';

class SelectedRoomTable extends StatelessWidget {
  final bool isSettingsDisabled;

  const SelectedRoomTable({super.key, this.isSettingsDisabled = false});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RoomsState>();

    Room? selectedRoom =
        state.selectedRoom != null && state.rooms.has(state.selectedRoom!.id)
            ? state.selectedRoom
            : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Выбранная комната',
              style: Theme.of(context).textTheme.titleLarge,
            )),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 900,
          child: DataTable(

              columnSpacing: 60,
              columns: const [
                DataColumn(label: Text('Название')),
                DataColumn(label: Text('Роль')),
                DataColumn(label: Text('Обвиняемый')),
                DataColumn(label: Text('Прокурор')),
                // DataColumn(label: Text('Наблюдатели')),
                DataColumn(label: Text(''))
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text(selectedRoom != null ? selectedRoom.name : '')),
                  DataCell(Text(state.selectedRole != null
                      ? 'Ваша роль — ${state.selectedRole!.title}'
                      : '')),
                  DataCell(Text(selectedRoom?.defendant?.name ?? '')),
                  DataCell(Text(selectedRoom?.plaintiff?.name ?? '')),
                  // DataCell(Text(
                  //     '${selectedRoom?.observers != null ? selectedRoom?.observers.length : ''}')),
                  DataCell(selectedRoom != null && !isSettingsDisabled
                      ? RowSettingsMenuButton(
                          roomId: selectedRoom.id,
                        )
                      : Text('')),
                ])
              ]),
        ),
      ],
    );
  }
}
