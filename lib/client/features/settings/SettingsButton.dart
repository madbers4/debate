import 'package:flutter/material.dart';
import 'package:v1/client/features/settings/SettingsDialog.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      tooltip: 'Settings',
      onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => Dialog(
                child:
                    Container(width: 400, height: 400, child: SettingsDialog()),
              )),
    );
  }
}
