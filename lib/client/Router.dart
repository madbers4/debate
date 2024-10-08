import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v1/client/features/game/GameScreen.dart';
import 'package:v1/client/features/loading/LoadingScreen.dart';
import 'package:v1/client/features/rooms/RoomsScreen.dart';
import 'package:v1/client/features/scenarious/ScenariousSceen.dart';
import 'package:v1/client/features/sign-in/SignInScreen.dart';

Function createSliderBuilder =
    (BuildContext context, GoRouterState state, Widget w) {
  var direction = state.pathParameters['direction']!;

  if (direction == 'no') {
    direction = 'right';
  }

  Offset offsetBeginNewPage;
  Offset offsetEndOldPage;

  if (direction == 'left') {
    offsetBeginNewPage = const Offset(-1.0, 0.0);
    offsetEndOldPage = const Offset(1.0, 0.0);
  } else {
    offsetBeginNewPage = const Offset(1.0, 0.0);
    offsetEndOldPage = const Offset(-1.0, 0.0);
  }

  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: w,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tweenNewPage = Tween(begin: offsetBeginNewPage, end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeInOut));
      var tweenOldPage = Tween(begin: Offset.zero, end: offsetEndOldPage)
          .chain(CurveTween(curve: Curves.easeInOut));

      final newPageChild = child;
      final oldPageChild = Container(
        key: ValueKey('_oldPage_${state.pageKey}'),
        child: Container(),
      );

      return Stack(
        children: [
          SlideTransition(
            position: secondaryAnimation.drive(tweenOldPage),
            child: Offstage(
              offstage: animation.status != AnimationStatus.reverse,
              child: Offstage(
                offstage: animation.status != AnimationStatus.reverse,
                child: oldPageChild,
              ),
            ),
          ),
          SlideTransition(
            position: animation.drive(tweenNewPage),
            child: newPageChild,
          ),
        ],
      );
    },
    transitionDuration: Duration(
        milliseconds: state.pathParameters['direction']! == 'no' ? 0 : 300),
  );
};

class AppRouter {
  final router = GoRouter(
    // TODO: REPLACE THIS
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/sign-in/:direction',
        pageBuilder: (context, state) =>
            createSliderBuilder(context, state, const SignInScreen()),
      ),
      GoRoute(
        path: '/rooms/:direction',
        pageBuilder: (context, state) =>
            createSliderBuilder(context, state, const RoomsScreen()),
      ),
      GoRoute(
        path: '/scenarious/:direction',
        pageBuilder: (context, state) =>
            createSliderBuilder(context, state, const ScenariousScreen()),
      ),
      GoRoute(
        path: '/game/:direction',
        pageBuilder: (context, state) {
          return createSliderBuilder(context, state, const GameScreen());
        },
      ),
    ],
  );
}

final router = AppRouter().router;
