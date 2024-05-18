import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/api/ApiClient.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/settings/SettingsState.dart';
import 'package:v1/client/widgets/style/Palette.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Phoenix(child: const MyApp()));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  if (!kIsWeb) {
    Wakelock.enable();
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: scaffoldKey,
        body: MultiProvider(
            providers: [
              Provider(create: (context) => Palette()),
              ChangeNotifierProvider(
                create: (context) => SettingsState(),
                lazy: true,
              ),
              ChangeNotifierProxyProvider<SettingsState, ApiClient>(
                  create: (context) => ApiClient(),
                  update: (context, settingsState, apiClient) {
                    if (settingsState.settings != null) {
                      apiClient!.connect(settingsState.settings!);
                    }

                    return apiClient!;
                  }),
              ProxyProvider<ApiClient, RoomsClient>(
                  create: (context) => RoomsClient(),
                  update: (context, apiClient, roomsClient) {
                    if (apiClient.socketClient != null) {
                      roomsClient!.setClient(apiClient.socketClient!);
                    }

                    return roomsClient!;
                  }),
              ChangeNotifierProxyProvider<ApiClient, AutorizationClient>(
                  create: (context) => AutorizationClient(),
                  update: (context, apiClient, authClient) {
                    if (apiClient.socketClient != null) {
                      authClient!.setClient(apiClient.socketClient!);
                    }

                    return authClient!;
                  }),
              ChangeNotifierProxyProvider<AutorizationClient, AppState>(
                  create: (context) => AppState(),
                  update: (context, authClient, appState) {
                    final apiClient =
                        Provider.of<ApiClient>(context, listen: false);
                    final palette =
                        Provider.of<Palette>(context, listen: false);
                    final settignsState =
                        Provider.of<SettingsState>(context, listen: false);

                    if (authClient.socketClient != null) {
                      appState!.setClients(context, palette, authClient,
                          apiClient, settignsState);
                    }

                    return appState!;
                  }),
              ChangeNotifierProxyProvider<RoomsClient, RoomsState>(
                  create: (context) => RoomsState(),
                  update: (context, roomsClient, roomsState) {
                    if (roomsClient != null) {
                      roomsState!.setClients(context);
                    }
                    return roomsState!;
                  }),
            ],
            builder: (context, child) {
              // HARDCODE
              final _settingsState =
                  Provider.of<SettingsState>(context, listen: false);
              final _apiClient = Provider.of<ApiClient>(context, listen: false);
              final rClient = Provider.of<RoomsClient>(context, listen: false);
              final aClient =
                  Provider.of<AutorizationClient>(context, listen: false);
              final _appState = Provider.of<AppState>(context, listen: false);
              final _roomsState = Provider.of<AppState>(context, listen: false);

              return MaterialApp.router(
                // theme: ,
                routerConfig: router,
              );
            }),
      ),
    );
  }
}
