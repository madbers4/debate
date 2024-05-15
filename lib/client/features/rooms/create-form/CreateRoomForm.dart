import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/rooms/create-form/CreateRoomState.dart';
import 'package:v1/client/main.dart';

class CreateRoomForm extends StatelessWidget {
  CreateRoomForm({super.key});

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateRoomState>(
        create: (context) => CreateRoomState(context),
        builder: (context, widget) {
          final state = context.watch<CreateRoomState>();
          _nameController.text = state.name;

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
                        controller: _nameController,
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
                        ScaffoldMessenger.of(scaffoldKey.currentState!.context)
                            .showSnackBar(
                          SnackBar(
                              content: Text('Created room: ${state.name}')),
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
