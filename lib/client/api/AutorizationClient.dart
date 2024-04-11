import 'package:v1/common/features/autorization/AutorizationEndpointApi.dart';
import 'package:v1/common/features/autorization/AutorizationToken.dart';
import 'package:v1/common/features/autorization/SignInArgs.dart';
import 'package:v1/common/features/autorization/SignInFailArgs.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';

class AutorizationClient {
  SocketClient socketClient;
  AutorizationEndpointApi api = AutorizationEndpointApi();

  AutorizationClient(this.socketClient);

  String subToken(void Function(AutorizationToken token) callback) {
    return socketClient.subscribe(api.autorizationTokenHandler, callback);
  }

  String subSignInSuccess(void Function(Void _) callback) {
    return socketClient.subscribe(api.singInSuccessHandler, callback);
  }

  String subSignInFail(void Function(SignInFailArgs args) callback) {
    return socketClient.subscribe(api.signInFail, callback);
  }

  unsubscribe(String id) {
    socketClient.unsubscribe(id);
  }

  signIn(SignInArgs args) {
    socketClient.send(api.signInHandler, args);
  }

  tokenSignIn(AutorizationToken token) {
    socketClient.send(api.tokenSignInHandler, token);
  }

  observerSignIn() {
    socketClient.send(api.observerSignInHandler, Void());
  }
}
