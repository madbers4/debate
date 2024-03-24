import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:v1/client/widgets/BottomSnappingSheet.dart';
import 'package:v1/client/widgets/EvidenceCards.dart';

import 'widgets/LeftSnappingSheet.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: Svg('assets/images/background.svg'),
              repeat: ImageRepeat.repeat,
              fit: BoxFit.none),
        ),
        child: const LeftSnappingSheet(
            child: BottomSnappingSheet(child: EvidencesCards())));
  }
}
