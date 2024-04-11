import 'package:v1/common/features/autorization/AutorizationEndpointApi.dart';
import 'package:v1/common/features/autorization/AutorizationToken.dart';
import 'package:v1/common/features/autorization/SignInArgs.dart';
import 'package:v1/common/features/autorization/SignInFailArgs.dart';
import 'package:v1/common/features/autorization/SignInFailReason.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';
import 'package:v1/common/features/infrastructure/socket/SocketClient.dart';
import 'package:v1/server/features/autorization/JWTUtils.dart';

class AutorizationEndpoint {
  SocketClient socketClient;
  AutorizationEndpointApi api = AutorizationEndpointApi();

  AutorizationEndpoint(this.socketClient) {
    socketClient.subscribe(api.signInHandler, signIn);
    socketClient.subscribe(api.observerSignInHandler, observerSignIn);
    socketClient.subscribe(api.tokenSignInHandler, tokenSignIn);
  }

  void signIn(SignInArgs args) {
    print('sign in');
    if (args.password == '123456') {
      final token = AutorizationToken(
          username: args.username,
          hash: JWTUtils.generateAccessToken(userId: args.username));
      socketClient.send(api.singInSuccessHandler, Void());
      socketClient.send(api.autorizationTokenHandler, token);
    } else {
      print('send fail');
      socketClient.send(api.signInFail,
          SignInFailArgs(reason: SignInFailReason.WrongUserOrPassword));
    }
  }

  void observerSignIn(Void _) {
    print('observer sign in');
    socketClient.send(api.singInSuccessHandler, Void());
  }

  void tokenSignIn(AutorizationToken token) {
    print('token sign in');
    if (JWTUtils.verifyAccessToken(accessToken: token.hash)) {
      socketClient.send(api.singInSuccessHandler, Void());
    } else {
      socketClient.send(api.signInFail,
          SignInFailArgs(reason: SignInFailReason.InvalidToken));
    }
  }
}
