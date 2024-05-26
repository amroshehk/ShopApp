

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme() => ThemeData(
  appBarTheme:  AppBarTheme(
    titleSpacing: 20.0,
    elevation: 0.0,
    backgroundColor: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0),
    iconTheme: IconThemeData(color: HexColor("037EE6")),),
    scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 70,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: HexColor("037EE6"),
  backgroundColor: Colors.white),
  iconTheme: IconThemeData(color: HexColor("037EE6")),
  colorScheme: ColorScheme.fromSeed(seedColor: HexColor("037EE6")),
  useMaterial3: true,

    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18.0
        )),
    fontFamily: 'Jannah'
);


ThemeData darkTheme() => ThemeData(
    appBarTheme: AppBarTheme(

      elevation: 0.0,
      titleSpacing: 20.0,
      backgroundColor: HexColor('222831'),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("222831"),
          statusBarIconBrightness: Brightness.light),
      titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          fontFamily: 'Jannah'),
      iconTheme: IconThemeData(color: HexColor("037EE6")),),
    scaffoldBackgroundColor: HexColor("222831"),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 70,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: HexColor("037EE6"),
        backgroundColor:  HexColor("31363F"),
    unselectedItemColor: HexColor("6B728E")),
    iconTheme:  IconThemeData(color:HexColor("037EE6")),
    colorScheme: ColorScheme.fromSeed(seedColor: HexColor("037EE6")),
    useMaterial3: true,
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
          fontFamily: 'Jannah'
        )),
    fontFamily: 'Jannah'
);
