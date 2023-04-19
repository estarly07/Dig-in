import 'package:dig_in/presentation/login/blocs/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends InheritedWidget {
  final TextEditingController controllerEmail;
  final TextEditingController controllerPass;
  final TextEditingController controllerName;
  final TextEditingController controllerLastname;
  final Function onTap;
  final LoginState state;
  final bool showPassword;
  final Size size;

  RegisterProvider(
      {required this.controllerEmail,
      required this.controllerPass,
      required this.controllerName,
      required this.controllerLastname,
      required this.state,
      required this.onTap,
      required this.size,
      this.showPassword = false,
      required Widget child,
      Key? key})
      : super(child: child, key: key);

  @override
  bool updateShouldNotify(RegisterProvider oldWidget) {
    return true;
  }

  static RegisterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<RegisterProvider>()!;
}
