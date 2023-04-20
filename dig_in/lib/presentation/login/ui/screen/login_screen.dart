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
  final TextEditingController _controllerEmailRegister = TextEditingController();
  final TextEditingController _controllerPasswordRegister = TextEditingController();
  final TextEditingController _controllerNamesRegister = TextEditingController();
  final TextEditingController _controllerLastnamesRegister =TextEditingController();
  var showProgressButton = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Background(size: size),
          SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: ListView(
                  children: [
                    SizedBox(height: showLogin? size.height * 0.24 : size.height * 0.05,),
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
                    ),
                    SizedBox(height: size.height * 0.02,),
                    LineWithOr(color: Colors.grey.shade400,),
                    SizedBox(height: size.height * 0.02,),
                    SocialMedia(size: size.width * 0.12,onClick: (){
                      context.read<LoginBloc>().add(LoginByGoogleEvent());
                    },),
                    SizedBox(height: size.height * 0.02,),
                    InkWell(
                      onTap: () => setState(() {showLogin = !showLogin;}),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: showLogin?"Don't have an account" : "Already have an Account",
                            textColor: Colors.black,
                            fontSize: 15,
                          ),
                          SizedBox(width: 10,),
                          CustomText(
                            text:showLogin? "Register" : "Log in",
                            textColor: Colors.orange.shade900,
                            fontSize: 15,
                            withBold: !showLogin,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}