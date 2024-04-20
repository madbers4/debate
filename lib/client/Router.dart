import 'package:go_router/go_router.dart';
import 'package:v1/client/App.dart';
import 'package:v1/client/widgets/Menu/Games/GamesScreen.dart';
import 'package:v1/client/widgets/Menu/Loading/LoadingScreen.dart';
import 'package:v1/client/widgets/Menu/MainMenuScreen.dart';
import 'package:v1/client/widgets/Menu/Rooms/RoomsScreen.dart';
import 'package:v1/client/widgets/Menu/SignIn/SignInScreen.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: '/loading',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainMenuScreen(),
      ),
      GoRoute(
        path: '/loading',
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/game',
        builder: (context, state) => App(),
      ),
      GoRoute(
        path: '/rooms',
        builder: (context, state) => RoomsScreen(),
      ),
      GoRoute(
        path: '/games',
        builder: (context, state) => GamesScreen(),
      ),
    ],
  );
}

final router = AppRouter().router;
