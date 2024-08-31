import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/colors.dart';

class BottomSnappingSheet extends StatelessWidget {
  final Widget child;
  final Widget sheetContent;
  final bool? isHidden;

  const BottomSnappingSheet(
      {super.key,
      required this.child,
      required this.sheetContent,
      this.isHidden});

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      grabbingHeight: isHidden == true ? 0 : 25,
      grabbing: TransparentPointer(
        transparent: isHidden == true,
        child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: isHidden == true ? 0.0 : 1.0,
            child: Container(
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
            )),
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
          positionFactor: 0.44,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
      ],
      sheetBelow: SnappingSheetContent(
          draggable: false,
          sizeBehavior: SheetSizeStatic(size: 300, expandOnOverflow: false),
          child: TransparentPointer(
            transparent: isHidden == true,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              opacity: isHidden == true ? 0.0 : 1.0,
              child: sheetContent,
            ),
          )),
      child: child,
    );
  }
}
