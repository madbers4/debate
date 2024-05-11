import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/widgets/dialog/Dialog.dart';

class CardDescription extends StatelessWidget {
  final bool isShowed;
  final VoidCallback onClose;

  const CardDescription(
      {super.key, required this.isShowed, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      bodyContent: Stack(
        children: [
          // Card
          Container(),
          // Title
          Container(),
          // Description
          Container(),
          // Close
          Container(),
        ],
      ),
      isShowed: isShowed,
    );
  }
}
