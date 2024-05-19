import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/rooms/table/SelectedRoomTable.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/features/scenarious/ScenariousSceenState.dart';
import 'package:v1/client/features/scenarious/table/ScenariousTable.dart';
import 'package:v1/client/features/settings/SettingsButton.dart';
import 'package:v1/client/widgets/buttons/next/NextButton.dart';
import 'package:v1/client/widgets/style/Palette.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

class ScenariousScreen extends StatelessWidget {
  const ScenariousScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    // final playerProgress = context.watch<PlayerProgress>();

    return ChangeNotifierProvider(
        create: (context) => ScenarionScreenState(context),
        builder: (context, child) {
          final roomsState = context.watch<RoomsState>();
          final state = context.watch<ScenarionScreenState>();
          return ScreenLayout(
              bodyContent: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectedRoomTable(
                    isSettingsDisabled: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: SingleChildScrollView(child: ScenariousTable()))
                ],
              ),
              rightTopContent: SettingsButton(),
              leftBottomContent: BackButton(
                onPressed: () {
                  router.go('/rooms/left');
                },
              ),
              rightBottomContent: roomsState.selectedRole is Plaintiff &&
                      state.selectedScenarioId != null &&
                      roomsState.selectedRoom?.defendant != null
                  ? NextButton(
                      onPressed: () {
                        router.go('/game/right');
                      },
                    )
                  : TextButton(
                      onPressed: null,
                      child: Text(roomsState.selectedRole is Plaintiff
                          ? roomsState.selectedRoom?.defendant != null
                              ? 'Выберете сценарий'
                              : 'Ожидание обвиняемого'
                          : 'Ожидание прокурора'),
                    ));
        });
  }
}
