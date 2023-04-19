part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  LoginState();

  factory LoginState.initial  () => _LoginInitial();
  factory LoginState.loading  () => _LoadingState();
  factory LoginState.loaded   () => _LoadedState();
  factory LoginState.error    () => _ErrorState();
  factory LoginState.errorApi () => _ErrorApiState();
  factory LoginState.noConnectionInternet() => _NoConnectionInternet();

}

class _LoginInitial           extends LoginState {}
class _LoadingState           extends LoginState {}
class _LoadedState            extends LoginState {}
class _ErrorState             extends LoginState {}
class _ErrorApiState          extends LoginState {}
class _NoConnectionInternet   extends LoginState {}