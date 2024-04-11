import 'package:v1/common/features/autorization/AutorizationToken.dart';
import 'package:v1/common/features/autorization/SignInArgs.dart';
import 'package:v1/common/features/autorization/SignInFailArgs.dart';
import 'package:v1/common/features/infrastructure/endpoint/EndpointHandler.dart';
import 'package:v1/common/features/infrastructure/dto/Void.dart';

class AutorizationEndpointApi {
  EndpointHandler<AutorizationToken> autorizationTokenHandler = EndpointHandler(
      path: '/auth/token',
      accesses: [],
      dtoFactory: AutorizationToken.fromJson);

  EndpointHandler<SignInArgs> signInHandler = EndpointHandler(
      path: '/auth/sign-in', accesses: [], dtoFactory: SignInArgs.fromJson);

  EndpointHandler<AutorizationToken> tokenSignInHandler = EndpointHandler(
      path: '/auth/token-sign-in',
      accesses: [],
      dtoFactory: AutorizationToken.fromJson);

  EndpointHandler<Void> observerSignInHandler = EndpointHandler(
      path: '/auth/observer-sign-in', accesses: [], dtoFactory: Void.fromJson);

  EndpointHandler<Void> singInSuccessHandler = EndpointHandler(
      path: '/auth/auth/success', accesses: [], dtoFactory: Void.fromJson);

  EndpointHandler<SignInFailArgs> signInFail = EndpointHandler(
      path: '/auth/auth/fail',
      accesses: [],
      dtoFactory: SignInFailArgs.fromJson);
}
