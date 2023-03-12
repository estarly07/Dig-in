part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginByEmailAndPasswordEvent extends LoginEvent{
  final String email;
  final String password;
  LoginByEmailAndPasswordEvent(this.email, this.password);
}
class RegisterUserEvent extends LoginEvent {
  final String email;
  final String password;
  final String name;
  final String lastname;

  RegisterUserEvent(this.email, this.password, this.name, this.lastname);
  
}