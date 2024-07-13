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

    return SizedBox(
      width: 900,
      child: DataTable(
          columnSpacing: 60,
          columns: const [
            DataColumn(label: Text('Тайтл')),
            DataColumn(label: Text('Обвиняемый')),
            DataColumn(label: Text('Прокурор')),
            // DataColumn(label: Text('Наблюдатели')),
            DataColumn(label: Text('')),
          ],
          rows: state.rooms
              .getAll()
              .map<DataRow>((row) => DataRow(cells: [
                    DataCell(Text(row.name)),
                    DataCell(Text(row.defendant?.name ?? '')),
                    DataCell(Text(row.plaintiff?.name ?? '')),
                    // DataCell(Text('${row.observers.length}')),
                    DataCell(RowSettingsMenuButton(
                      roomId: row.id,
                    )),
                  ]))
              .toList()),
    );
  }
}
