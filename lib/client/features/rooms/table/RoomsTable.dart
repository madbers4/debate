import 'package:flutter/material.dart';
import 'package:v1/client/features/rooms/table/settings/SettingsCell.dart';

class RoomsTable extends StatelessWidget {
  const RoomsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      rows: const [
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Собачья комната')),
          DataCell(Text('Фурина')),
          DataCell(Text('Шарлотта')),
          DataCell(Text('10')),
          DataCell(RowSettingsMenuButton(
            roomId: '1',
          )),
        ]),
      ],
    );
  }
}
