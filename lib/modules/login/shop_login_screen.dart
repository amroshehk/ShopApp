import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/modules/login/cubit.dart';
import 'package:shop_app/modules/login/states.dart';
import 'package:shop_app/modules/register/shop_register_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginScreen extends StatelessWidget {
  ShopLoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var errorMessage = "";
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) => ShopLoginCubit(),
        child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
          builder: (BuildContext context, ShopLoginState state) {
            var cubit = ShopLoginCubit.get(context);
            return Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Colors.grey),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            defaultTextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must enter valid email";
                                  } else {
                                    return null;
                                  }
                                },
                                labelText: "E-Mail",
                                prefixIcon: Icon(Icons.email_outlined),
                                type: TextInputType.emailAddress,
                                context: context),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultTextFormField(
                                controller: passwordController,
                                obscureText: cubit.obscureText,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Must enter valid password";
                                  } else {
                                    return null;
                                  }
                                },

                                labelText: "Passwrod",
                                prefixIcon: Icon(Icons.lock_outline),
                                type: TextInputType.visiblePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(cubit.passwordSuffix),
                                  onPressed: () {
                                    cubit.changePassWordVisibility();
                                  },
                                ),
                                context: context),
                            const SizedBox(
                              height: 20,
                            ),
                            ConditionalBuilder(
                              condition: state is! ShopLoginLoadingState,
                              builder: (context) => defaultButton(
                                  title: 'login',
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                  color: defaultColor,
                                  radius: 40.0),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              errorMessage,
                              style: TextStyle(color: Colors.red),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                defaultTextButton(
                                    function: () {
                                      navigateTo(context, ShopRegisterScreen());
                                    },
                                    title: 'register')
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
          },
          listener: (context, state) {
            if(state is ShopLoginSuccessState){
              var status = state.loginModel?.status;
              if(status == true) {
                Fluttertoast.showToast(
                    msg: state.loginModel!.message.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              } else {
                Fluttertoast.showToast(
                    msg: state.loginModel!.message.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
            }
          },
        ),
      ),
    );
  }
}
