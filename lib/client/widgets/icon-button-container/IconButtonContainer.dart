import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';

class IconButtonContainer extends StatelessWidget {
  final Widget child;
  const IconButtonContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: goldColor, width: 2),
        shape: BoxShape.circle,
        
      ),
      child: child,
    );
  }
}
