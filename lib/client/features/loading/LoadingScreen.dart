import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/loading/LoadingScreenState.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return ChangeNotifierProvider<LoadingScreenState>(
        create: (context) => LoadingScreenState(context),
        builder: (context, child) {
          final state = context.watch<LoadingScreenState>();

          return ScreenLayout(bodyContent: Text('loading...'));
        });
  }
}
