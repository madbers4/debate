import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/colors.dart';

class LeftSnappingSheet extends StatelessWidget {
  final Widget child;
  final Widget sheetContent;
  final bool? isHidden;

  const LeftSnappingSheet(
      {super.key,
      required this.child,
      required this.sheetContent,
      this.isHidden});

  @override
  Widget build(BuildContext context) {
    return SnappingSheet.horizontal(
      grabbingWidth: isHidden == true ? 0 : 25,
      grabbing: TransparentPointer(
          transparent: isHidden == true,
          child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              opacity: isHidden == true ? 0.0 : 1.0,
              child: Container(
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
              ))),
      sheetLeft: SnappingSheetContent(
        draggable: false,
        sizeBehavior: SheetSizeStatic(size: 100.0, expandOnOverflow: false),
        child: TransparentPointer(
            transparent: isHidden == true,
            child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: isHidden == true ? 0.0 : 1.0,
                child: sheetContent)),
      ),
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.038,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          positionFactor: 0.18,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
      ],
      child: child,
    );
  }
}
