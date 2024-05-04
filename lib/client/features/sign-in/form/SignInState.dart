import 'package:flutter/widgets.dart';
import 'package:v1/client/api/AutorizationClient.dart';
import 'package:v1/client/features/sign-in/form/SignInFormFields.dart';
import 'package:v1/common/features/autorization/SignInArgs.dart';
import 'package:v1/common/features/autorization/SignInFailArgs.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';

class SignInFormState extends ChangeNotifier {
  AutorizationClient _client;

  final formKey = GlobalKey<FormState>();
  SignInFormFields _fields = SignInFormFields(username: '', password: '');
  String? error;

  SignInFormState(this._client, void Function(SignInFailArgs) onError,
      void Function(Void) onSuccess) {
    _client.subSignInFail(onError);
    _client.subSignInSuccess(onSuccess);
  }

  signIn() {
    _client.signIn(
        SignInArgs(username: _fields.username, password: _fields.password));
  }

  void observerSignIn() {
    _client.observerSignIn();
  }

  void setFields(SignInFormFields fields) {
    _fields = fields;
    notifyListeners();
  }

  void clearError() {
    error = null;
  }

  SignInFormFields getFields() {
    return _fields;
  }
}
