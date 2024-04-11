import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/api/ApiClient.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/client/widgets/style/palette.dart';
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
    return MultiProvider(
      providers: [
        Provider(create: (context) => Palette()),
        Provider<SocketClient>(create: (context) => ApiClient().socketClient),
        Provider<RoomsClient>(
            create: (context) =>
                RoomsClient(Provider.of<SocketClient>(context, listen: false))),
        Provider<AutorizationClient>(
            create: (context) => AutorizationClient(
                Provider.of<SocketClient>(context, listen: false))),
        ChangeNotifierProvider(
            create: (context) => AppState(
                Provider.of<AutorizationClient>(context, listen: false))),
      ],
      child: MaterialApp.router(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        ),
        routerConfig: router,
      ),
    );
  }
}
