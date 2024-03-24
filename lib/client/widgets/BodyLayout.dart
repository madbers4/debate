import 'package:flutter/material.dart';
import 'package:v1/client/widgets/Events/EventsWidget.dart';
import 'package:v1/client/widgets/Timer.dart';


class BodyLayout extends StatelessWidget {
  const BodyLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopTimer(),
        const EventsWidget(),
      ],
    );
  }
}
