import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:v1/client/widgets/BodyLayout.dart';


class BottomSnappingSheet extends StatelessWidget {
  final Widget child;

  const BottomSnappingSheet({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      // TODO: Add your content that is placed
      // behind the sheet. (Can be left empty)
      grabbingHeight: 75,
    
      // TODO: Add your grabbing widget here,
      grabbing: Container(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 200,
            height: 5,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ),
      ),
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.0,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(positionFactor: 0.4),
        SnappingPosition.factor(
          positionFactor: 0.63,
          grabbingContentOffset: GrabbingContentOffset.top,
          ),
        SnappingPosition.factor(
          positionFactor: 0.8,
          grabbingContentOffset: GrabbingContentOffset.top,
          ),
      ],
      sheetBelow: SnappingSheetContent(
        draggable: false,
        sizeBehavior: SheetSizeStatic(size: 300, expandOnOverflow: false),
        child: child,
      ),
      child: const BodyLayout(),
    );
  }
}
