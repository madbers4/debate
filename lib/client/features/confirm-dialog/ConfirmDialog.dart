import 'package:flutter/material.dart';
import 'package:v1/client/widgets/dialog/Dialog.dart';

class ConfirmDialog extends StatelessWidget {
  bool isShowed;
  VoidCallback onClose;
  VoidCallback onConfirm;

  ConfirmDialog({required this.isShowed, required this.onClose, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      bodyContent: Stack(
        children: [
          // Title
          Container(),
          // Close
          Container(),
          // Open
          Container()
        ],
      ),
      isShowed: isShowed,
    );
  }
}
