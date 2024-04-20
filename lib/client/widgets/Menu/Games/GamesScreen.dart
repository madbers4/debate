import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/widgets/Menu/Games/GamesScreenState.dart';
import 'package:v1/client/widgets/style/Palette.dart';
import 'package:v1/client/widgets/style/ResponsiveScreen.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    // final playerProgress = context.watch<PlayerProgress>();

    return ChangeNotifierProvider(
        create: (context) => GamesScreenState(context),
        builder: (context, child) {
          final state = context.watch<GamesScreenState>();
          return Scaffold(
            backgroundColor: palette.backgroundLevelSelection,
            body: ResponsiveScreen(
              squarishMainArea: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'Сценарии',
                        style: TextStyle(
                            fontFamily: 'Permanent Marker', fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: ListView(
                      children: [
                        for (final (index, scenario) in state.scenarios.indexed)
                          ListTile(
                            enabled: true,
                            onTap: () {
                              GoRouter.of(context).go('/play/session/${index}');
                            },
                            leading: Text(index.toString()),
                            title: Text('${scenario.title}'),
                          )
                      ],
                    ),
                  ),
                ],
              ),
              rectangularMenuArea: FilledButton(
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
                child: const Text('Назад'),
              ),
            ),
          );
        });
  }
}
