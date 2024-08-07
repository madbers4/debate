import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/api/ApiClient.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/api/GameClient.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/features/game/GameState.dart';
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
    return MultiProvider(
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
          ChangeNotifierProxyProvider<ApiClient, RoomsClient>(
              create: (context) => RoomsClient(),
              update: (context, apiClient, roomsClient) {
                if (apiClient.socketClient != null) {
                  roomsClient!.setClient(apiClient.socketClient!);
                }

                return roomsClient!;
              }),
          ChangeNotifierProxyProvider<ApiClient, GameClient>(
              create: (context) => GameClient(),
              update: (context, apiClient, gameClient) {
                if (apiClient.socketClient != null) {
                  gameClient!.setClient(apiClient.socketClient!);
                }

                return gameClient!;
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
                final palette = Provider.of<Palette>(context, listen: false);
                final settignsState =
                    Provider.of<SettingsState>(context, listen: false);

                if (authClient.socketClient != null) {
                  appState!.setClients(
                      context, palette, authClient, apiClient, settignsState);
                }

                return appState!;
              }),
          ChangeNotifierProxyProvider<RoomsClient, RoomsState>(
              create: (context) => RoomsState(),
              update: (context, roomsClient, roomsState) {
                if (roomsClient.socketClient != null) {
                  roomsState!.setClients(context);
                }
                return roomsState!;
              }),
          ChangeNotifierProxyProvider<GameClient, GameState>(
              create: (context) => GameState(),
              update: (context, gameClient, gameState) {
                if (gameClient.socketClient != null) {
                  gameState!.setClients(context);
                }
                return gameState!;
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
          final gameClient = Provider.of<GameClient>(context, listen: false);
          final _appState = Provider.of<AppState>(context, listen: false);
          final _roomsState = Provider.of<RoomsState>(context, listen: false);
          final _gameState = Provider.of<GameState>(context, listen: false);

          return MaterialApp.router(
            themeMode: ThemeMode.dark,
            theme: ThemeData(
              useMaterial3: false,
              brightness: Brightness.dark,
              fontFamily: 'Genshin',
            ),
            builder: (context, child) => Scaffold(
                key: scaffoldKey,
                body: Stack(children: [
                  child ?? Container(),
                  TransparentPointer(
                      child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          clipBehavior: Clip.none,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/frame.png'),
                                repeat: ImageRepeat.noRepeat,
                                fit: BoxFit.fitWidth),
                          ))),
                ])),
            routerConfig: router,
          );
        });
  }
}
