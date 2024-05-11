import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/rooms/create-form/CreateRoomState.dart';

class CreateRoomForm extends StatelessWidget {
  const CreateRoomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateRoomState>(
        create: (context) => CreateRoomState(context),
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
                        initialValue: state.name,
                        onChanged: (value) {
                          state.changeName(value);
                        },
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(height: 0),
                          labelText: 'Имя комнаты',
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    // SizedBox(
                    //   width: 200,
                    //   child: DropdownButtonFormField<String>(
                    //     value: state.role.toString(),
                    //     items: List.from(PlayerRole.values
                    //         .map<DropdownMenuItem<String>>(
                    //             (e) => DropdownMenuItem<String>(
                    //                   value: e.toString(),
                    //                   child: Text(e.toString().split('.')[1]),
                    //                 ))),
                    //     onChanged: (String? value) {
                    //       state.changeRole(PlayerRole.values.firstWhere(
                    //           (element) => element.toString() == value));
                    //     },
                    //     decoration: const InputDecoration(
                    //         border: OutlineInputBorder(), labelText: 'Роль'),
                    //   ),
                    // ),
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
                                  'Create room: ${state.name}, role: ${state.role}')),
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
