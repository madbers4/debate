import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:v1/client/colors.dart';

class BottomSnappingSheet extends StatelessWidget {
  final Widget child;
  final Widget sheetContent;

  const BottomSnappingSheet(
      {super.key, required this.child, required this.sheetContent});

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      grabbingHeight: 15,
      grabbing: Container(
        color: Colors.transparent,
        alignment: Alignment.bottomCenter,
        child: Center(
          child: Container(
            width: 200,
            height: 5,
            decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ),
      ),
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.05,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          positionFactor: 0.15,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          positionFactor: 0.40,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
      ],
      sheetBelow: SnappingSheetContent(
        draggable: false,
        sizeBehavior: SheetSizeStatic(size: 300, expandOnOverflow: false),
        child: sheetContent,
      ),
      child: child,
    );
  }
}
