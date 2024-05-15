import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/rooms/table/settings/SettingsCell.dart';

class RoomsTable extends StatelessWidget {
  const RoomsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RoomsState>();

    return DataTable(
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
        rows: state.rooms
            .getAll()
            .indexed
            .map<DataRow>((row) => DataRow(cells: [
                  DataCell(Text(row.$1.toString())),
                  DataCell(Text(row.$2.name)),
                  DataCell(Text(row.$2.defendant?.name ?? '')),
                  DataCell(Text(row.$2.plaintiff?.name ?? '')),
                  DataCell(Text('${row.$2.observers.length}')),
                  DataCell(RowSettingsMenuButton(
                    roomId: row.$2.id,
                  )),
                ]))
            .toList());
  }
}
