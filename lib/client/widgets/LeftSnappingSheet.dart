import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class LeftSnappingSheet extends StatelessWidget {
  final Widget child;
  final Widget sheetContent;

  const LeftSnappingSheet({
    super.key,
    required this.child,
    required this.sheetContent,
  });

  @override
  Widget build(BuildContext context) {
    return SnappingSheet.horizontal(
      grabbingWidth: 75,
      grabbing: Container(
        color: Colors.transparent,
        height: 250,
        child: Center(
          child: Container(
            width: 5,
            height: 200,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 15, 13, 13),
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ),
      ),
      sheetLeft: SnappingSheetContent(
        draggable: false,
        sizeBehavior: SheetSizeStatic(size: 180.0, expandOnOverflow: false),
        child: sheetContent,
      ),
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.0,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          positionFactor: 0.15,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
      ],
      child: child,
    );
  }
}
