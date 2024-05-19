import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v1/client/AppState.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/features/settings/SettingsFields.dart';
import 'package:provider/provider.dart';
import 'package:v1/client/features/settings/SettingsFormState.dart';
import 'package:v1/client/features/settings/SettingsState.dart';

class SettingsDialog extends StatelessWidget {
  final BuildContext globalContext;
  final TextEditingController _apiController = TextEditingController(text: '');

  SettingsDialog({super.key, required this.globalContext});

  @override
  Widget build(BuildContext context) {
    final _settingsState = globalContext.watch<SettingsState>();
    final _appState = globalContext.watch<AppState>();

    return ChangeNotifierProvider<SettingsFormState>(
        create: (_) => SettingsFormState(globalContext),
        builder: (context, child) {
          final state = context.watch<SettingsFormState>();
          _apiController.text = state.getFields().apiHost;

          return Form(
            key: state.formKey,
            child: ScreenLayout(
              bodyContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      initialValue: state.getFields().username,
                      maxLength: 10,
                      onChanged: (value) {
                        SettingsFields fields = state.getFields();

                        state.setFields(SettingsFields(
                            username: value,
                            apiHost: fields.apiHost,
                            timeousSec: fields.timeousSec));
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
                        counterStyle: TextStyle(
                          height: 0,
                        ),
                        counterText: '',
                        labelText: 'Имя',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _apiController,

                          maxLength: 30,
                          // controller: _apiController,
                          onChanged: (value) {
                            SettingsFields fields = state.getFields();

                            state.setFields(SettingsFields(
                                username: fields.username,
                                apiHost: value,
                                timeousSec: fields.timeousSec));
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
                            counterStyle: TextStyle(
                              height: 0,
                            ),
                            counterText: '',
                            labelText: 'Хост',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            _apiController.text = 'https://test.com';

                            SettingsFields fields = state.getFields();
                            state.setFields(SettingsFields(
                                username: fields.username,
                                apiHost: _apiController.text,
                                timeousSec: fields.timeousSec));
                          },
                          child: const Text('Глобальный'))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: state.getFields().timeousSec.toString(),
                      maxLength: 9,
                      minLines: 1,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        SettingsFields fields = state.getFields();

                        state.setFields(SettingsFields(
                            username: fields.username,
                            apiHost: fields.apiHost,
                            timeousSec: int.tryParse(value) != null
                                ? int.parse(value)
                                : 0));
                      },
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.parse(value) <= 0) {
                          return '';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(height: 0),
                        helperStyle: TextStyle(height: 0),
                        counterStyle: TextStyle(
                          height: 0,
                        ),
                        helperText: '',
                        counterText: '',
                        labelText: 'Таймаут (сек)',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _appState.isUserAutorized != null
                      ? TextButton(
                          onPressed: () {
                            state.logout();
                          },
                          child: Text('Логаут'))
                      : Container()
                ],
              ),
              leftBottomContent: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Закрыть'),
              ),
              rightBottomContent: TextButton(
                onPressed: () {
                  if (state.formKey.currentState!.validate()) {
                    state.save();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Сохранить'),
              ),
            ),
          );
        });
  }
}
