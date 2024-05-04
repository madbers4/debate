import 'package:flutter/material.dart';
import 'package:v1/client/features/rooms/table/cells/HeadCell.dart';

class RoomTableHeadRow extends StatelessWidget {
  const RoomTableHeadRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeadCell(title: 'Тайтл'),
        HeadCell(title: 'Обвиняемый'),
        HeadCell(title: 'Обвинение'),
        HeadCell(title: 'Смотрители')
      ],
    );
  }
}
