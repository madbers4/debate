import 'package:flutter/material.dart';

class RowSettingsMenuButton extends StatelessWidget {
  final String roomId;

  const RowSettingsMenuButton({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) =>
              IconButton(
        icon: const Icon(Icons.more_vert),
        tooltip: 'Actions',
        onPressed: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open();
          }
        },
      ),
      menuChildren: [
        MenuItemButton(
          child: Text('Войти как обвиняемый'),
          onPressed: () {},
        ),
        MenuItemButton(
          child: Text('Войти как прокурор'),
          onPressed: () {},
        ),
        MenuItemButton(
          child: Text('Войти как смотритель'),
          onPressed: () {},
        ),
        MenuItemButton(
          child: Text('Выйти'),
          onPressed: () {},
        ),
        MenuItemButton(
          child: Text('Удалить'),
          onPressed: () {},
        ),
      ],
    );
  }
}
