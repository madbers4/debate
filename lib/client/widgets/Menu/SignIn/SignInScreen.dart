import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/widgets/Menu/SignIn/SignInForm/SignInForm.dart';
import 'package:v1/client/widgets/Menu/SignIn/SignInForm/SignInState.dart';
import 'package:v1/client/widgets/style/ResponsiveScreen.dart';
import 'package:v1/client/widgets/style/palette.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Scaffold(
        backgroundColor: palette.backgroundSettings,
        body: ResponsiveScreen(
          squarishMainArea: Center(
            child: Transform.rotate(
              angle: -0.1,
              child: Text(
                'Логин',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 55,
                  height: 1,
                ),
              ),
            ),
          ),
          rectangularMenuArea: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SignInForm()]),
        ));
  }

  static const _gap = SizedBox(height: 10);
}
