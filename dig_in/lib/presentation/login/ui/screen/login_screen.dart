import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:dig_in/presentation/login/blocs/bloc/login_bloc.dart';
import 'package:dig_in/presentation/login/ui/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showLogin = true;
  //LOGIN
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  //REGISTER
  final TextEditingController _controllerEmailRegister = TextEditingController();
  final TextEditingController _controllerPasswordRegister = TextEditingController();
  final TextEditingController _controllerNamesRegister = TextEditingController();
  final TextEditingController _controllerLastnamesRegister = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _Background(size: size),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return ListView(
                    children: [
                      SizedBox(
                        height: size.height * 0.24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              showLogin = true;
                            }),
                            child: CustomText(
                              text: "Login",
                              textColor: showLogin
                                  ? Colors.white
                                  : Colors.grey.shade300.withOpacity(0.5),
                              fontSize: 25,
                              withBold: true,
                            ),
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              showLogin = false;
                            }),
                            child: CustomText(
                              text: "Signup",
                              textColor: showLogin
                                  ? Colors.grey.shade300.withOpacity(0.5)
                                  : Colors.white,
                              fontSize: 25,
                              withBold: !showLogin,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      showLogin
                          ? LoginProvider(
                              controllerEmail: _controllerEmail,
                              controllerPass: _controllerPassword,
                              showPassword: false,
                              size: size,
                              child: const Login())
                          : RegisterProvider(
                              controllerEmail: _controllerEmailRegister,
                              controllerPass: _controllerPasswordRegister,
                              controllerLastname: _controllerLastnamesRegister,
                              controllerName: _controllerNamesRegister,
                              size: size,
                              child: const Register()),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          text: "forgot password?",
                          textColor: Colors.blue.shade800,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: showLogin? size.height * 0.15 : size.height * 0.05,
                      ),
                      CustomButton(
                        color: Colors.orange.shade900,
                        onTap: () {
                          if(showLogin){
                            context.read<LoginBloc>().add(
                              LoginByEmailAndPasswordEvent(
                                  _controllerEmail.text.trim(),
                                  _controllerPassword.text.trim()));
                          }else{
                            context.read<LoginBloc>().add(
                              RegisterUserEvent(
                                _controllerEmailRegister.text.trim(), 
                                _controllerPasswordRegister.text.trim(), 
                                _controllerNamesRegister.text.trim(), 
                                _controllerLastnamesRegister.text.trim()
                              )
                            );
                          }
                        },
                        wait: state is LoadingState,
                        text: showLogin? "Login" :"Register",
                        textColor: Colors.white,
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            "assets/images/food.jpg",
            fit: BoxFit.cover,
            height: size.height * 0.4,
          ),
        ),
      ],
    );
  }
}

class LoginProvider extends InheritedWidget {
  final TextEditingController controllerEmail;
  final TextEditingController controllerPass;
  final bool showPassword;
  final Size size;

  LoginProvider(
      {required this.controllerEmail,
      required this.controllerPass,
      required this.size,
      this.showPassword = false,
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

class RegisterProvider extends InheritedWidget {
  final TextEditingController controllerEmail;
  final TextEditingController controllerPass;
  final TextEditingController controllerName;
  final TextEditingController controllerLastname;
  final bool showPassword;
  final Size size;

  RegisterProvider(
      {required this.controllerEmail,
      required this.controllerPass,
      required this.controllerName,
      required this.controllerLastname,
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
