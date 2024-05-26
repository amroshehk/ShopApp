import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/themes.dart';

import 'modules/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: OnBoardingScreen(),
    );
  }
}
