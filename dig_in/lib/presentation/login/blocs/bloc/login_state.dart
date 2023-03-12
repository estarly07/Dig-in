part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  LoginState();

  factory LoginState.initial() => LoginInitial();
  factory LoginState.loading() => LoadingState();
  factory LoginState.loaded () => LoadedState();
  factory LoginState.error  () => ErrorState();
  factory LoginState.errorApi () => ErrorApiState();

}

class LoginInitial extends LoginState {}
class LoadingState extends LoginState {}
class LoadedState  extends LoginState {}
class ErrorState   extends LoginState {}
class ErrorApiState   extends LoginState {}