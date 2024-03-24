import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:v1/client/widgets/RPCards.dart';

class LeftSnappingSheet extends StatelessWidget {
  final Widget child;
  
  const LeftSnappingSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SnappingSheet.horizontal(
      grabbingWidth: 75,
      grabbing: Container(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 5,
            height: 200,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ),
      ),
      sheetLeft: SnappingSheetContent(
        draggable: false,
        sizeBehavior: SheetSizeStatic(size: 180.0, expandOnOverflow: false),
        // TODO: Add your sheet content here
        child: const RPCards(),
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
