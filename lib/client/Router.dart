import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/widgets/Menu/MainMenuScreen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) =>
            const MainMenuSceenWidget(key: Key('main menu')),
        routes: [
          GoRoute(
            path: 'play',
            pageBuilder: (context, state) => buildMyTransition<void>(
              key: ValueKey('play'),
              color: context.watch<Palette>().backgroundLevelSelection,
              child: const LevelSelectionScreen(
                key: Key('level selection'),
              ),
            ),
            routes: [
              GoRoute(
                path: 'session/:level',
                pageBuilder: (context, state) {
                  final levelNumber = int.parse(state.pathParameters['level']!);
                  final level =
                      gameLevels.singleWhere((e) => e.number == levelNumber);
                  return buildMyTransition<void>(
                    key: ValueKey('level'),
                    color: context.watch<Palette>().backgroundPlaySession,
                    child: PlaySessionScreen(
                      level,
                      key: const Key('play session'),
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'won',
                redirect: (context, state) {
                  if (state.extra == null) {
                    // Trying to navigate to a win screen without any data.
                    // Possibly by using the browser's back button.
                    return '/';
                  }

                  // Otherwise, do not redirect.
                  return null;
                },
                pageBuilder: (context, state) {
                  final map = state.extra! as Map<String, dynamic>;
                  final score = map['score'] as Score;

                  return buildMyTransition<void>(
                    key: ValueKey('won'),
                    color: context.watch<Palette>().backgroundPlaySession,
                    child: WinGameScreen(
                      score: score,
                      key: const Key('win game'),
                    ),
                  );
                },
              ),
            ],
          )
        ]),
    // GoRoute(
    //   path: 'settings',
    //   builder: (context, state) =>
    //       const SettingsScreen(key: Key('settings')),
    // ),
  ],
);
