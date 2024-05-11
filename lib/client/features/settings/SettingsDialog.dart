import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v1/client/features/screen/ScreenLayout.dart';
import 'package:v1/client/features/settings/SettingsFields.dart';
import 'package:v1/client/features/settings/SettingsState.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SettingsState(context),
        builder: (context, child) {
          final state = context.watch<SettingsState>();
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
                      onChanged: (value) {
                        SettingsFields fields = state.getFields();

                        state.setFields(SettingsFields(
                            username: value,
                            apiHost: fields.apiHost,
                            timeoutMs: fields.timeoutMs));
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
                          initialValue: state.getFields().apiHost,
                          onChanged: (value) {
                            SettingsFields fields = state.getFields();

                            state.setFields(SettingsFields(
                                username: fields.apiHost,
                                apiHost: value,
                                timeoutMs: fields.timeoutMs));
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
                            labelText: 'Хост',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('Глобальный'))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: state.getFields().timeoutMs.toString(),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        SettingsFields fields = state.getFields();

                        state.setFields(SettingsFields(
                            username: fields.username,
                            apiHost: fields.apiHost,
                            timeoutMs: int.tryParse(value) != null
                                ? int.parse(value)
                                : 0));
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
                        labelText: 'Таймаут (сек)',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(onPressed: () {}, child: Text('Логаут'))
                ],
              ),
              leftBottomContent: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Закрыть'),
              ),
              rightBottomContent: TextButton(
                onPressed: () {},
                child: const Text('Сохранить'),
              ),
            ),
          );
        });
  }
}
