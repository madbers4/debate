import 'package:flutter/material.dart';
import 'package:v1/client/features/scenarious/table/ScenariousTableRow.dart';

class ScenariousTable extends StatelessWidget {
  const ScenariousTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScenariousTableRow(
          key: const Key('1'),
          rowId: '1',
          isSelected: false,
          title: 'mock',
          onSelect: () {},
        ),
      ],
    );
  }
}
