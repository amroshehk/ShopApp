import 'package:flutter/cupertino.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/shared_preferences.dart';
import '../login/shop_login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Container(
        child: Column(
          children: [
            Text('salla'),
            defaultTextButton(
                function: () {
                  submit(context);
                },
                title: 'logout')
          ],
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    CacheHelper.removeData(key: USER_TOKEN)?.then((value) {
      if (value == true) {
        navigateToAndFinish(context, ShopLoginScreen());
      }
    });
  }
}
