import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/widgets/Menu/SignIn/SignInForm/SignInFormFields.dart';
import 'package:v1/client/widgets/Menu/SignIn/SignInForm/SignInState.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return ChangeNotifierProvider<SignInFormState>(
        create: (context) => SignInFormState(
                Provider.of<AutorizationClient>(context, listen: false),
                (error) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ошибка: ${error.message}'),
                  backgroundColor: palette.backgroundError,
                ),
              );
            }, (_) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Успешно'),
                  backgroundColor: palette.backgroundSuccess,
                ),
              );
              context.go('/');
            }),
        builder: (context, widget) {
          final state = Provider.of<SignInFormState>(context);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (state.error != null) {
              state.clearError();
            }
          });

          return Form(
            key: state.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        initialValue: state.getFields().username,
                        onChanged: (value) {
                          state.setFields(SignInFormFields(
                              username: value,
                              password: state.getFields().username));
                        },
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Пожалуйста, введите логин';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Логин',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        initialValue: state.getFields().password,
                        onChanged: (value) {
                          state.setFields(SignInFormFields(
                              username: state.getFields().username,
                              password: value));
                        },
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Пожалуйста, введите пароль';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Пароль',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (state.formKey.currentState!.validate()) {
                      state.signIn();
                    }
                  },
                  child: const Text('Войти'),
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    state.observerSignIn();
                  },
                  child: const Text('Войти как гость'),
                ),
              ],
            ),
          );
        });
  }
}
