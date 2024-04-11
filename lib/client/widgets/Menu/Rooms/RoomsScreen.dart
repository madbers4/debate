import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/client/widgets/Menu/Rooms/CreateRoomForm/CreateRoomForm.dart';
import 'package:v1/client/widgets/Menu/Rooms/RoomsState.dart';
import 'package:v1/client/widgets/style/palette.dart';
import 'package:v1/client/widgets/style/ResponsiveScreen.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    // final playerProgress = context.watch<PlayerProgress>();

    return ChangeNotifierProvider(
        create: (context) => RoomsState(Provider.of<RoomsClient>(context)),
        builder: (context, child) {
          final state = context.watch<RoomsState>();

          return Scaffold(
            backgroundColor: palette.backgroundLevelSelection,
            body: ResponsiveScreen(
              squarishMainArea: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'Выбор комнат',
                        style: TextStyle(
                            fontFamily: 'Permanent Marker', fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: ListView(
                      children: [
                        for (final room in state.rooms.list)
                          ListTile(
                            enabled: true,
                            onTap: () {
                              GoRouter.of(context)
                                  .go('/play/session/${room.name}');
                            },
                            // leading: Text(level.number.toString()),
                            title: Text('${room.name}'),
                          ),
                      ],
                    ),
                  ),
                  CreateRoomForm(),
                ],
              ),
              rectangularMenuArea: FilledButton(
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
                child: const Text('Назад'),
              ),
            ),
          );
        });
  }
}
