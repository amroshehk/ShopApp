import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/login/shop_login_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/shared_preferences.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('salla'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('salla'),
            defaultTextButton(function: () {
              submit(context);
            },title:  'logout')
          ],
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    CacheHelper.clearData(key: USER_TOKEN)?.then((value) {
      if (value == true) {
        navigateToAndFinish(context, ShopLoginScreen());
      }
    });
  }
}
