import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/widgets/icon-button-container/IconButtonContainer.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isHidden;

  const NextButton({super.key, required this.onPressed, this.isHidden = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: isHidden ? 0.0 : 1.0,
      child: IconButtonContainer(
          child: IconButton(
              onPressed: isHidden == false ? onPressed : null,
              icon: const Icon(
                Icons.arrow_forward,
                color: grayColor,
              ))),
    );
  }
}
