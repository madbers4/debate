import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/features/scenarious/ScenariousSceenState.dart';
import 'package:provider/provider.dart';

class ScenariousTable extends StatelessWidget {
  const ScenariousTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScenarionScreenState>();

    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Сценарии',
              style: Theme.of(context).textTheme.titleLarge,
            )),
        const SizedBox(height: 10),
        ListView.separated(
            shrinkWrap: true,
            itemCount: state.scenarios.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, int index) {
              final scenario = state.scenarios[index];

              return ListTile(
                enabled: true,
                onTap: () {
                  // GoRouter.of(context).go('/play/session/${index}');
                },
                leading: Text(index.toString()),
                title: Text('${scenario.title}'),
              );
            })
      ],
    );
  }
}
