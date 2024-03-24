import 'package:go_router/go_router.dart';
import 'package:v1/client/App.dart';
import 'package:v1/client/widgets/Menu/MainMenuScreen.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainMenuSceenWidget(),
      ),
      GoRoute(
        path: '/game',
        builder: (context, state) => App(),
      ),
    ],
  );
}

final router = AppRouter().router;
