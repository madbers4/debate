import 'package:v1/common/features/settings/Settings.dart';

class SettingsFields extends Settings {
  SettingsFields(
      {super.username,
      super.apiHost = 'http://localhost:3000',
      super.timeoutMs = 300000});
}
