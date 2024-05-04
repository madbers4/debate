import 'package:flutter/material.dart';
import 'package:v1/client/features/rooms/table/RoomsTableHeadRow.dart';
import 'package:v1/client/features/rooms/table/RoomsTableRow.dart';

class RoomsTable extends StatelessWidget {
  const RoomsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RoomTableHeadRow(),
        RoomTableRow(
          roomId: 'mock...',
        ),
      ],
    );
  }
}
