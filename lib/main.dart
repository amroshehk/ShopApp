import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layouts/shop/ShopLayout.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit_observer.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/shared_preferences.dart';
import 'package:shop_app/shared/styles/themes.dart';

import 'modules/login/shop_login_screen.dart';
import 'modules/on_boarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = AppBlocObserver();
  Widget widget;
  if(CacheHelper.getData(key: IS_ON_BPARDING_NEEDED) != null){
    if (CacheHelper.getData(key: USER_TOKEN) == null) {
      widget = ShopLoginScreen();
    } else {
      widget = ShopLayout();
    }
  } else {
    widget = OnBoardingScreen();
  }
  CacheHelper.getData(key: USER_TOKEN);
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  late Widget widget;
  MyApp(this.widget, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: widget,
    );
  }
}
