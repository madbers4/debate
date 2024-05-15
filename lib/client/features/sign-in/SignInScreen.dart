import 'package:flutter/material.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/features/settings/SettingsButton.dart';
import 'package:v1/client/features/sign-in/form/SignInForm.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      bodyContent: Container(
        alignment: Alignment.bottomRight,
        child: const SignInForm(),
      ),
      rightTopContent: const SettingsButton(),
    );
  }
}
