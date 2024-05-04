import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v1/client/widgets/events/EventsWidget.dart';
import 'package:v1/client/widgets/Timer.dart';

class BodyLayout extends StatelessWidget {
  const BodyLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopTimer(),
            FilledButton(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              child: const Text('Меню'),
            ),
          ],
        ),
        const EventsWidget(),
      ],
    );
  }
}
