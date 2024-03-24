import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/widgets/GameCard/GameCardState.dart';
import 'package:v1/client/widgets/style/ResponsiveScreen.dart';
import 'package:v1/client/widgets/style/palette.dart';

class MainMenuSceenWidget extends StatelessWidget {
  const MainMenuSceenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return ChangeNotifierProvider<GameCardWidgetState>(
        create: (context) => GameCardWidgetState(),
        builder: (context, rre) {
          return Scaffold(
            backgroundColor: palette.backgroundMain,
            body: ResponsiveScreen(
              squarishMainArea: Center(
                child: Transform.rotate(
                  angle: -0.1,
                  child: const Text(
                    'Дебаты',
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
                    child: const Text('Сценарии'),
                    onPressed: () {},
                  ),
                  _gap,
                  FilledButton(
                    child: const Text('Комнаты'),
                    onPressed: () {},
                  ),
                  _gap,
                  FilledButton(
                    child: const Text('Настройки'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        });
  }

  static const _gap = SizedBox(height: 10);
}
