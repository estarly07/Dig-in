import 'package:dig_in/presentation/login/blocs/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginProvider extends InheritedWidget {
  final TextEditingController controllerEmail;
  final TextEditingController controllerPass;
  final bool showPassword;
  final Function onTap;
  LoginState? state;
  final Size size;

  LoginProvider(
      {required this.controllerEmail,
      required  this.controllerPass,
      required  this.size,
      required  this.onTap,
      this.showPassword = false,
      this.state,
      required Widget child,
      Key? key})
      : super(child: child, key: key);

  @override
  bool updateShouldNotify(LoginProvider oldWidget) {
    return true;
  }

  static LoginProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LoginProvider>()!;
}