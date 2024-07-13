import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/widgets/icon-button-container/IconButtonContainer.dart';

class BackButton2 extends StatelessWidget {
  final VoidCallback onPressed;

  const BackButton2({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButtonContainer(
        child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back,
              color: grayColor,
            )));
  }
}
