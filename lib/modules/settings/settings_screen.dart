import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/shop/cubit.dart';
import '../../layouts/shop/states.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;

        nameController.text = model!.data!.name.toString();
        emailController.text = model.data!.email.toString();
        phoneController.text = model.data!.phone.toString();

        return ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children:
                [
                  // if(state is ShopLoadingUpdateUserState)
                  //   LinearProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultTextFormField(
                    controller: nameController,
                    type: TextInputType.name,
                      validator: (value) {
                      if (value.isEmpty) {
                        return 'name must not be empty';
                      }

                      return null;
                    },
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                      context: context
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultTextFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                      validator: (value) {
                      if (value.isEmpty) {
                        return 'email must not be empty';
                      }

                      return null;
                    },
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                      context: context
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultTextFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'phone must not be empty';
                      }

                      return null;
                    },
                    labelText: 'Phone',
                    prefixIcon: Icon(Icons.phone),
                    context: context
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: () {
                      print("defaultButton");
                      signOut(context);
                    },
                    title: 'Logout',
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}