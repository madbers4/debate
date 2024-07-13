import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/features/scenarious/ScenariousSceenState.dart';
import 'package:provider/provider.dart';
import 'package:v1/common/features/player/Plaintiff.dart';

class ScenariousTable extends StatelessWidget {
  const ScenariousTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScenarionScreenState>();
    final roomsState = context.watch<RoomsState>();

    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Сценарии',
              style: Theme.of(context).textTheme.titleLarge,
            )),
        const SizedBox(height: 20),
        ListView.separated(
            shrinkWrap: true,
            itemCount: state.scenarious_.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, int index) {
              final scenario = state.scenarious_[index];
              final isSelected = scenario.id == state.selectedScenarioId;

              return ListTile(
                enabled: true,
                selected: isSelected,
                onTap: roomsState.selectedRole is Plaintiff
                    ? () {
                        if (isSelected) {
                          state.selectScenario(null);
                        } else {
                          state.selectScenario(scenario.id);
                        }
                        // GoRouter.of(context).go('/play/session/${index}');
                      }
                    : null,
                // leading: Text(index.toString()),
                title: Text('${index}    ${scenario.description.title}'),
              );
            })
      ],
    );
  }
}
