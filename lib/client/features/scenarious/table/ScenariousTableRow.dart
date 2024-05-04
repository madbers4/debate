import 'package:flutter/material.dart';

class ScenariousTableRow extends StatelessWidget {
  final String rowId;
  final String title;
  final bool isSelected;
  final bool? isDisabled;
  final VoidCallback onSelect;

  const ScenariousTableRow(
      {super.key,
      required this.rowId,
      required this.title,
      required this.isSelected,
      required this.onSelect,
      this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Selected Icon
        Container(),
        // Row Id
        Container(),
        // Title
        Container(),
      ],
    );
  }
}
