import 'package:go_router/go_router.dart';
import 'package:v1/client/features/game/GameScreen.dart';
import 'package:v1/client/features/loading/LoadingScreen.dart';
import 'package:v1/client/features/rooms/RoomsScreen.dart';
import 'package:v1/client/features/scenarious/ScenariousSceen.dart';
import 'package:v1/client/features/sign-in/SignInScreen.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: '/game',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/rooms',
        builder: (context, state) => RoomsScreen(),
      ),
      GoRoute(
        path: '/scenarious',
        builder: (context, state) => ScenariousScreen(),
      ),
      GoRoute(
        path: '/game',
        builder: (context, state) => GameScreen(),
      ),
    ],
  );
}

final router = AppRouter().router;
