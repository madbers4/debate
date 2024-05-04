import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/api/ApiClient.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/client/features/settings/SettingsState.dart';
import 'package:v1/client/widgets/style/Palette.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  if (!kIsWeb) {
    Wakelock.enable();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        ),
        home: Scaffold(
          body: MultiProvider(
            providers: [
              Provider(create: (context) => Palette()),
              Provider(create: (context) => SettingsState(context)),
              Provider<ApiClient>(create: (context) => ApiClient()),
              Provider<SocketClient>(
                  create: (context) =>
                      Provider.of<ApiClient>(context, listen: false)
                          .socketClient),
              Provider<RoomsClient>(
                  create: (context) => RoomsClient(
                      Provider.of<SocketClient>(context, listen: false))),
              Provider<AutorizationClient>(
                create: (context) => AutorizationClient(
                    Provider.of<SocketClient>(context, listen: false)),
              ),
              ChangeNotifierProvider(create: (context) => AppState(context)),
            ],
            builder: (context, child) => MaterialApp.router(
              routerConfig: router,
            ),
          ),
        ));
  }
}
