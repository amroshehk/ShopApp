import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/modules/register/shop_register_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/colors.dart';

class ShopLoginScreen extends StatelessWidget {
  ShopLoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:   Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("LOGIN" ,style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.black
                ),),
                SizedBox(height: 10,),
                Text('Login now to browse our hot offers',style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.grey
                ),),
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    defaultTextFormField(
                        controller: emailController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Must enter valid email";
                          }
                          else {
                            return null;
                          }
                        },
                        labelText: "E-Mail",
                        prefixIcon: Icon(Icons.email_outlined),
                        type:  TextInputType.emailAddress,
                        context: context
                    ),
                    const SizedBox(
                      height: 20,
                    ),
          
                    defaultTextFormField(
                        controller: passwordController,
                        obscureText: obscureText,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Must enter valid password";
                          }
                          else {
                            return null;
                          }
                        },
                        labelText: "Passwrod",
                        prefixIcon: Icon(Icons.lock_outline),
                        type:  TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          icon:Icon(obscureText ? Icons.visibility_off : Icons.visibility),onPressed: () {
          
                          },)
                        ,context: context
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultButton(title: 'login', function: (){},color: defaultColor ,radius: 40.0),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style: TextStyle(fontSize: 14.0),),
                        defaultTextButton(function: () {
                          navigateTo(context, ShopRegisterScreen());
                        },title:  'register')
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
