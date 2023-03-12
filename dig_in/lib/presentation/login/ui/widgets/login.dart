import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:dig_in/presentation/login/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        widget: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: LoginProvider.of(context).size.width *0.05,
            vertical: LoginProvider.of(context).size.height * 0.05
          ),
          child: Wrap(
            children: [
              CustomTextField(
                textType: TextInputType.emailAddress, 
                controller: LoginProvider.of(context).controllerEmail, 
                hintText: "Email",
                prefixIcon: Icon(Icons.email,color: Colors.grey.shade400,),
                textColor: Colors.grey.shade400,
                
              ),
              SizedBox(height: LoginProvider.of(context).size.height * 0.1,),
              CustomTextField(
                textType: TextInputType.emailAddress, 
                controller: LoginProvider.of(context).controllerPass, 
                hintText: "Password",
                textColor:Colors.grey.shade400,
                isPassword: true,
                prefixIcon: Icon(Icons.lock_open_rounded,color: Colors.grey.shade400,),
              )

            ],
          ),
        ),
        shadowColor: Colors.grey,
        elevation: 13,
        backgroundColor: Colors.white,
        cornerRadius: LoginProvider.of(context).size.width * 0.025);
  }
}
