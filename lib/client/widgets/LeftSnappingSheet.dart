import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:v1/client/colors.dart';

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
      grabbingWidth: 15,
      grabbing: Container(
        color: Colors.transparent,
        height: 250,
        child: Center(
          child: Container(
            width: 5,
            height: 200,
            decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ),
      ),
      sheetLeft: SnappingSheetContent(
        draggable: false,
        sizeBehavior: SheetSizeStatic(size: 100.0, expandOnOverflow: false),
        child: sheetContent,
      ),
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.038,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          positionFactor: 0.175,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
      ],
      child: child,
    );
  }
}
