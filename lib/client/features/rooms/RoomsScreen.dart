import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/rooms/table/SelectedRoomTable.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/features/rooms/create-form/CreateRoomForm.dart';
import 'package:v1/client/features/rooms/table/RoomsTable.dart';
import 'package:v1/client/features/settings/SettingsButton.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final state = context.watch<RoomsState>();
    final appState = context.watch<AppState>();

    return ScreenLayout(
      bodyContent: Stack(
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SelectedRoomTable(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Игровые комнаты',
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                const SizedBox(
                  height: 10,
                ),
                const RoomsTable(),
              ],
            ),
          ),
          Positioned(
              left: 20,
              bottom: 0,
              child: appState.isUserAutorized! ? CreateRoomForm() : Container())
        ],
      ),
      rightTopContent: const SettingsButton(),
      rightBottomContent: state.selectedRoom != null
          ? NextButton(
              onPressed: () {
                router.go('/scenarious/right');
              },
            )
          : const TextButton(
              onPressed: null,
              child: Text('Выберите комнату'),
            ),
    );
  }
}

// class RoomsScreen extends StatelessWidget {
//   const RoomsScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final palette = context.watch<Palette>();
//     // final playerProgress = context.watch<PlayerProgress>();

//     return ChangeNotifierProvider(
//         create: (context) =>
//             RoomsState(Provider.of<RoomsClient>(context, listen: false)),
//         builder: (context, child) {
//           final state = context.watch<RoomsState>();

//           return Scaffold(
//             backgroundColor: palette.backgroundLevelSelection,
//             body: ResponsiveScreen(
//               squarishMainArea: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(16),
//                     child: Center(
//                       child: Text(
//                         'Выбор комнат',
//                         style: TextStyle(
//                             fontFamily: 'Permanent Marker', fontSize: 30),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   Expanded(
//                     child: ListView(
//                       children: [
//                         for (final room in state.rooms.getAll())
//                           ListTile(
//                             enabled: true,
//                             onTap: () {
//                               GoRouter.of(context)
//                                   .go('/play/session/${room.name}');
//                             },
//                             // leading: Text(level.number.toString()),
//                             title: Text('${room.name}'),
//                           ),
//                       ],
//                     ),
//                   ),
//                   CreateRoomForm(),
//                 ],
//               ),
//               rectangularMenuArea: FilledButton(
//                 onPressed: () {
//                   GoRouter.of(context).go('/');
//                 },
//                 child: const Text('Назад'),
//               ),
//             ),
//           );
//         });
//   }
// }
