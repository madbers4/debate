import 'package:go_router/go_router.dart';
import 'package:v1/client/App.dart';
import 'package:v1/client/widgets/Menu/GamesScreen.dart';
import 'package:v1/client/widgets/Menu/MainMenuScreen.dart';
import 'package:v1/client/widgets/Menu/Rooms/RoomsScreen.dart';
import 'package:v1/client/widgets/Menu/SignIn/SignInScreen.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: '/sign-in',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainMenuSceenWidget(),
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
