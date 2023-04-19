import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:dig_in/presentation/login/blocs/bloc/login_bloc.dart';
import 'package:dig_in/presentation/login/ui/providers/login_widget_provider.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size  = LoginProvider.of(context).size;
    final state = LoginProvider.of(context).state;
    return Column(
      children: [
        CustomCard(
            widget: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width  * 0.05,
                vertical  : size.height * 0.05
              ),
              child: Wrap(
                children: [
                  CustomTextField(
                    textType: TextInputType.emailAddress, 
                    controller: LoginProvider.of(context).controllerEmail, 
                    hintText: "Email",
                    error: 
                      state.runtimeType == LoginState.error().runtimeType && 
                        LoginProvider.of(context).controllerEmail.text.isEmpty?
                          "Este campo debe estar lleno" : "",
                    prefixIcon: Icon(Icons.email,color: Colors.grey.shade400,),
                    textColor: Colors.grey,
                    
                  ),
                  SizedBox(height: LoginProvider.of(context).size.height * 0.1,),
                  CustomTextField(
                    textType: TextInputType.emailAddress, 
                    controller: LoginProvider.of(context).controllerPass, 
                    hintText: "Password",
                    textColor:Colors.grey,
                    isPassword: true,
                    error: 
                      state.runtimeType == LoginState.error().runtimeType && 
                        LoginProvider.of(context).controllerPass.text.isEmpty ?
                          "Este campo debe estar lleno" : "",
                    prefixIcon: Icon(Icons.lock_open_rounded,color: Colors.grey.shade400,),
                  )

                ],
              ),
            ),
            shadowColor: Colors.grey,
            elevation: 13,
            backgroundColor: Colors.white,
            cornerRadius: LoginProvider.of(context).size.width * 0.025),
        SizedBox( height: size.height * 0.03,),
        Align(
          alignment: Alignment.centerRight,
          child: CustomText(
            text: "forgot password?",
            textColor: Colors.blue.shade800,
            fontSize: 17,
          ),
        ),
        SizedBox( height:size.height * 0.05),
        CustomButton(
          color: Colors.orange.shade900,
          onTap: () => LoginProvider.of(context).onTap(),
          wait: LoginProvider.of(context).state.runtimeType == LoginState.loading().runtimeType,
          text: "Login" ,
          textColor: Colors.white,
        )
      ],
    );
  }
}
