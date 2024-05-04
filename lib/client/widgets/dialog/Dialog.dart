import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  Widget bodyContent;
  bool isShowed;

  CustomDialog({required this.bodyContent, required this.isShowed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.bodyContent,
    );
  }
}
