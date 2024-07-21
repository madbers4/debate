import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';

const tintColor = Color.fromARGB(255, 204, 204, 204);

class DebatesButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;
  final String text;
  final bool? red;
  final double? fontSize;

  const DebatesButton(
      {super.key,
      this.onPressed,
      required this.isEnabled,
      required this.text,
      this.red,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(isEnabled ? whiteColor : grayColor),
            shadowColor: MaterialStateProperty.all(tintColor),
            overlayColor: MaterialStateProperty.all(tintColor),
            surfaceTintColor: MaterialStateProperty.all(tintColor)),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Genshin',
              fontSize: fontSize,
              color: isEnabled
                  ? (red == true ? redColor : blueColor)
                  : const Color.fromARGB(255, 199, 199, 199)),
        ));
  }
}
