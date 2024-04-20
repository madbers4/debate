import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/widgets/GameCard/GameCardState.dart';
import 'package:v1/client/widgets/style/ResponsiveScreen.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final appState = Provider.of<AppState>(context, listen: false);

    return ChangeNotifierProvider<GameCardWidgetState>(
        create: (context) => GameCardWidgetState(),
        child: Scaffold(
          backgroundColor: palette.backgroundMain,
          body: ResponsiveScreen(
            squarishMainArea: Center(
              child: Transform.rotate(
                angle: -0.1,
                child: Text(
                  appState.authToken != null
                      ? appState.authToken!.username
                      : '',
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
              children: [
                FilledButton(
                  child: const Text('Играть'),
                  onPressed: () {
                    context.go('/game');
                  },
                ),
                _gap,
                FilledButton(
                  child: const Text('Сценарии'),
                  onPressed: () {
                    context.go('/games');
                  },
                ),
                _gap,
                FilledButton(
                  child: const Text('Комнаты'),
                  onPressed: () {
                    context.go('/rooms');
                  },
                ),
                _gap,
                FilledButton(
                  child: const Text('Настройки'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }

  static const _gap = SizedBox(height: 10);
}
