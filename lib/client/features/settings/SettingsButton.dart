import 'package:flutter/material.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/features/settings/SettingsDialog.dart';
import 'package:v1/client/widgets/icon-button-container/IconButtonContainer.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButtonContainer(
        child: IconButton(
      icon: const Icon(
        Icons.settings,
        color: grayColor,
      ),
      tooltip: 'Settings',
      onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext _) => Dialog(
                child: SizedBox(
                    width: 400,
                    height: 350,
                    child: SettingsDialog(
                      globalContext: context,
                    )),
              )),
    ));
  }
}
