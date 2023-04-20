import 'package:animate_do/animate_do.dart';
import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:dig_in/presentation/login/ui/providers/register_widget_provider.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc/login_bloc.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerProvider = RegisterProvider.of(context);
    return Column(
      children: [
        FadeIn(
          duration: Duration(milliseconds: 500),
          child: SlideInUp(
            duration: Duration(milliseconds: 500),
            child: CustomCard(
              widget: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: registerProvider.size.width *0.05,
                  vertical: registerProvider.size.height * 0.05
                ),
                child: Wrap(
                  children: [
                    CustomTextField(
                      textType: TextInputType.emailAddress, 
                      controller: registerProvider.controllerName, 
                      hintText: "Names", 
                      textColor: Colors.grey,
                      prefixIcon: Icon(Icons.person,color: Colors.grey.shade300,),
                    ),
                    SizedBox(height: registerProvider.size.height * 0.1,),
                    CustomTextField(
                      textType: TextInputType.emailAddress, 
                      controller: registerProvider.controllerLastname, 
                      hintText: "Last names", 
                      textColor: Colors.grey,
                      prefixIcon: Icon(Icons.person,color: Colors.grey.shade300,),
                    ),
                    SizedBox(height: registerProvider.size.height * 0.1,),
                    CustomTextField(
                      textType: TextInputType.emailAddress, 
                      controller: registerProvider.controllerEmail, 
                      hintText: "Email", 
                      textColor: Colors.grey,
                      prefixIcon: Icon(Icons.email,color: Colors.grey.shade300,),
                    ),
                    SizedBox(height: registerProvider.size.height * 0.1,),
                    CustomTextField(
                      textType: TextInputType.emailAddress, 
                      controller: registerProvider.controllerPass, 
                      hintText: "Password", 
                      textColor: Colors.grey,
                      prefixIcon: Icon(Icons.lock_open_outlined,color: Colors.grey.shade300,),
                    ),
                  ],
                ),
              ),
              shadowColor: Colors.grey,
              elevation: 13,
              backgroundColor: Colors.white,
              cornerRadius: registerProvider.size.width * 0.025,
            ),
          )
        ),
        SizedBox( height:registerProvider.size.height * 0.1),
        FadeIn(
          duration: Duration(milliseconds: 700),
          child: SlideInUp(
            duration: Duration(milliseconds: 700),
            child: CustomButton(
              color: Colors.orange.shade900,
              onTap: () => registerProvider.onTap(),
              wait: registerProvider.state.runtimeType == LoginState.loading().runtimeType,
              text: "Login" ,
              textColor: Colors.white,
            ),
          )
        )
      ],
    );
  }
}
