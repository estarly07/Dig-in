import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:dig_in/presentation/login/blocs/bloc/login_bloc.dart';
import 'package:dig_in/presentation/login/ui/providers/login_widget_provider.dart';
import 'package:dig_in/presentation/login/ui/providers/register_widget_provider.dart';
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
  final TextEditingController _controllerEmailRegister =
      TextEditingController();
  final TextEditingController _controllerPasswordRegister =
      TextEditingController();
  final TextEditingController _controllerNamesRegister =
      TextEditingController();
  final TextEditingController _controllerLastnamesRegister =
      TextEditingController();
  var showProgressButton = false;

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
                child: ListView(
                  children: [
                    SizedBox(
                      height: size.height * 0.24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => setState(() => showLogin = true ),
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
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return showLogin? 
                          LoginProvider(
                            controllerEmail: _controllerEmail,
                            controllerPass: _controllerPassword,
                            state: state,
                            showPassword: false,
                            onTap: (){
                              context.read<LoginBloc>().add(LoginByEmailAndPasswordEvent(
                                _controllerEmail.text.trim(),
                                _controllerPassword.text.trim())
                              );
                            },
                            size: size,
                            child: const Login()): 
                          RegisterProvider(
                            controllerEmail: _controllerEmailRegister,
                            controllerPass: _controllerPasswordRegister,
                            controllerLastname: _controllerLastnamesRegister,
                            controllerName: _controllerNamesRegister,
                            state: state,
                            onTap: (){
                              context.read<LoginBloc>().add(RegisterUserEvent(
                                _controllerEmailRegister.text.trim(),
                                _controllerPasswordRegister.text.trim(),
                                _controllerNamesRegister.text.trim(),
                                _controllerLastnamesRegister.text.trim())
                              );
                            },
                            size: size,
                            child: const Register());
                      },
                    )
                  ],
                )),
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