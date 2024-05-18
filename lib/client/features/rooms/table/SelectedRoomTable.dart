import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/rooms/table/settings/SettingsCell.dart';
import 'package:v1/common/features/room/Room.dart';

class SelectedRoomTable extends StatelessWidget {
  const SelectedRoomTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RoomsState>();

    Room? selectedRoomWithRoomsIndex =
        state.selectedRoom != null && state.rooms.has(state.selectedRoom!.id)
            ? state.rooms.get(state.selectedRoom!.id)
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
        DataTable(
            // columnSpacing: 60,
            columns: const [
              DataColumn(
                label: Text('#'),
              ),
              DataColumn(label: Text('Тайтл')),
              DataColumn(label: Text('Обвиняемый')),
              DataColumn(label: Text('Прокурор')),
              DataColumn(label: Text('Смотрители')),
              DataColumn(label: Text('')),
            ],
            rows: selectedRoomWithRoomsIndex != null
                ? [
                    DataRow(cells: [
                      DataCell(Text(selectedRoomWithRoomsIndex.toString())),
                      DataCell(Text(selectedRoomWithRoomsIndex.name)),
                      DataCell(Text(
                          selectedRoomWithRoomsIndex.defendant?.name ?? '')),
                      DataCell(Text(
                          selectedRoomWithRoomsIndex.plaintiff?.name ?? '')),
                      DataCell(Text(
                          '${selectedRoomWithRoomsIndex.observers.length}')),
                      DataCell(RowSettingsMenuButton(
                        roomId: selectedRoomWithRoomsIndex.id,
                      )),
                    ])
                  ]
                : []),
      ],
    );
  }
}
