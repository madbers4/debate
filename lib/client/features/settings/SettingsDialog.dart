import 'package:flutter/material.dart';
import 'package:v1/client/features/settings/SettingsState.dart';
import 'package:v1/client/widgets/dialog/Dialog.dart';
import 'package:provider/provider.dart';

class SettingsDialog extends StatelessWidget {
  bool isShowed;
  VoidCallback onClose;

  SettingsDialog({required this.isShowed, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsState>();

    return CustomDialog(
      isShowed: isShowed,
      bodyContent: Stack(
        children: [
          // Name
          Container(),
          // Host
          Container(),
          // Timeout
          Container(),
          // Exit
          Container(),
          // Save
          Container()
        ],
      ),
    );
  }
}
