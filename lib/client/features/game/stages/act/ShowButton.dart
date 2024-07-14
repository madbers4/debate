import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';

class ShowButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isShowed;

  const ShowButton({super.key, this.onPressed, required this.isShowed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(isShowed ? grayColor : whiteColor),
            shadowColor: MaterialStateProperty.all(grayColor)),
        onPressed: onPressed,
        child: Text(
          !isShowed ? 'Показать' : 'Показано',
          style: TextStyle(
              fontFamily: 'Genshin',
              color: !isShowed
                  ? blueColor
                  : const Color.fromARGB(255, 199, 199, 199)),
        ));
  }
}
