import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/menu/MenuLayout.dart';
import 'package:v1/client/features/rooms/table/RoomsTable.dart';
import 'package:v1/client/features/scenarious/ScenariousSceenState.dart';
import 'package:v1/client/features/settings/SettingsButton.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    // final playerProgress = context.watch<PlayerProgress>();

    return ChangeNotifierProvider(
        create: (context) => ScenarionScreenState(context),
        builder: (context, child) {
          final state = context.watch<ScenarionScreenState>();
          return ScreenLayout(
              bodyContent: Stack(
                children: [
                  // With one row
                  RoomsTable(),
                  // ScenariousTable
                ],
              ),
              rightTopContent: SettingsButton(),
              leftBottomContent: BackButton(),
              // TODO: OR Waiting button
              rightBottomContent: NextButton());
        });
  }
}

// class GamesScreen extends StatelessWidget {
//   const GamesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final palette = context.watch<Palette>();
//     // final playerProgress = context.watch<PlayerProgress>();

//     return ChangeNotifierProvider(
//         create: (context) => GamesScreenState(context),
//         builder: (context, child) {
//           final state = context.watch<GamesScreenState>();
//           return Scaffold(
//             backgroundColor: palette.backgroundLevelSelection,
//             body: ResponsiveScreen(
//               squarishMainArea: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(16),
//                     child: Center(
//                       child: Text(
//                         'Сценарии',
//                         style: TextStyle(
//                             fontFamily: 'Permanent Marker', fontSize: 30),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   Expanded(
//                     child: ListView(
//                       children: [
//                         for (final (index, scenario) in state.scenarios.indexed)
//                           ListTile(
//                             enabled: true,
//                             onTap: () {
//                               GoRouter.of(context).go('/play/session/${index}');
//                             },
//                             leading: Text(index.toString()),
//                             title: Text('${scenario.title}'),
//                           )
//                       ],
//                     ),
//                   ),
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
