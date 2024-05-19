import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/features/sign-in/form/SignInFormFields.dart';
import 'package:v1/client/features/sign-in/form/SignInState.dart';
import 'package:v1/client/main.dart';
import 'package:v1/client/widgets/style/Palette.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return ChangeNotifierProvider<SignInFormState>(
        create: (_) =>
            SignInFormState(context.watch<AutorizationClient>(), (error) {
              ScaffoldMessenger.of(scaffoldKey.currentContext!)
                  .clearSnackBars();
              ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
                SnackBar(
                  content: Text('Ошибка: ${error.message}'),
                  backgroundColor: palette.backgroundError,
                ),
              );
            }, (_) {
              // ScaffoldMessenger.of(scaffoldKey.currentContext!)
              //     .clearSnackBars();
              // ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
              //   SnackBar(
              //     content: Text('Успешно'),
              //     backgroundColor: palette.backgroundSuccess,
              //   ),
              // );
              // router.go('/rooms/right');
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
              mainAxisAlignment: MainAxisAlignment.end,
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
                            return '';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(height: 0),
                          labelText: 'Логин',
                        ),
                      ),
                    ),
                    const SizedBox(
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
                            return '';
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(height: 0),
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
