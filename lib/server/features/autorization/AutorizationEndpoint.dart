import 'package:v1/common/features/autorization/AutorizationEndpointApi.dart';
import 'package:v1/common/features/autorization/AutorizationToken.dart';
import 'package:v1/common/features/autorization/SignInArgs.dart';
import 'package:v1/common/features/autorization/SignInFailArgs.dart';
import 'package:v1/common/features/autorization/SignInSuccessArgs.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';

class AutorizationEndpoint {
  SocketClient socketClient;
  AutorizationEndpointApi api = AutorizationEndpointApi();

  AutorizationEndpoint(this.socketClient);

  unsubscribe(String id) {
    socketClient.unsubscribe(id);
  }

  String subObserverSignIn(void Function(Void _) callback) {
    return socketClient.subscribe(api.observerSignInHandler, callback);
  }

  String subSignIn(void Function(SignInArgs args) callback) {
    return socketClient.subscribe(api.signInHandler, callback);
  }

  String subTokenSignInHandler(void Function(AutorizationToken args) callback) {
    return socketClient.subscribe(api.tokenSignInHandler, callback);
  }

  void sendSuccess(SignInSuccessArgs args) {
    socketClient.send(api.singInSuccessHandler, args);
  }

  void sendFail(SignInFailArgs args) {
    socketClient.send(api.signInFail, args);
  }

  void sendAuthToken(AutorizationToken args) {
    socketClient.send(api.autorizationTokenHandler, args);
  }
}
