import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';
import 'dark_colors.dart';

ThemeData lightTheme() => ThemeData(
    primaryColor: defaultDarkColor,
    appBarTheme: AppBarTheme(
          titleSpacing: 20.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              fontFamily: 'Jannah'),
          iconTheme: IconThemeData(color: defaultColor),
    ),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 70,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultColor,
        backgroundColor: Colors.white),
    iconTheme: IconThemeData(color: defaultColor),
    colorScheme: ColorScheme.fromSeed(seedColor: defaultColor),
    useMaterial3: true,
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18.0),
        titleSmall: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.3,
        )),
    fontFamily: 'Jannah');

ThemeData darkTheme() => ThemeData(
    primaryColor: defaultDarkColor,
    appBarTheme: AppBarTheme(
          elevation: 0.0,
          titleSpacing: 20.0,
          backgroundColor: Colors.black12,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: HexColor("222831"),
              statusBarIconBrightness: Brightness.light),
          titleTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              fontFamily: 'Jannah'),
          iconTheme: IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: defaultDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 70,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: HexColor("31363F"),
        unselectedItemColor: HexColor("6B728E")),
    iconTheme: IconThemeData(color: Colors.white),
    colorScheme: ColorScheme.fromSeed(seedColor: defaultDarkColor),
    useMaterial3: true,
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
            fontFamily: 'Jannah'),
        titleSmall: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.3,
        )),
    fontFamily: 'Jannah');
