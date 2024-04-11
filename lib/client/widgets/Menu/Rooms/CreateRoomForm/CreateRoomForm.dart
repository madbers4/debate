import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/api/RoomsClient.dart';
import 'package:v1/client/widgets/Menu/Rooms/CreateRoomForm/CreateRoomState.dart';
import 'package:v1/common/features/player/Role.dart';

class CreateRoomForm extends StatelessWidget {
  CreateRoomForm();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateRoomState>(
        create: (context) => CreateRoomState(Provider.of<RoomsClient>(context)),
        builder: (context, widget) {
          final state = context.watch<CreateRoomState>();

          return Form(
            key: state.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        initialValue: state.getName(),
                        onChanged: (value) {
                          state.changeName(value);
                        },
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Пожалуйста, введите текст';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Имя комнаты',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 200,
                      child: DropdownButtonFormField<String>(
                        value: state.getRole().toString(),
                        items: List.from(Role.values
                            .map<DropdownMenuItem<String>>(
                                (e) => DropdownMenuItem<String>(
                                      value: e.toString(),
                                      child: Text(e.toString().split('.')[1]),
                                    ))),
                        onChanged: (String? value) {
                          state.changeRole(Role.values.firstWhere(
                              (element) => element.toString() == value));
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Роль'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (state.formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Create room: ${state.getName()}, role: ${state.getRole()}')),
                        );

                        state.create();
                      }
                    },
                    child: const Text('Создать комнату'),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
