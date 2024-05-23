

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme() => ThemeData(
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    elevation: 0.0,
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0),
    iconTheme: IconThemeData(color: Colors.deepOrange),),
    scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 70,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
  backgroundColor: Colors.white),
  iconTheme: const IconThemeData(color: Colors.deepOrange),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  useMaterial3: true,

    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18.0
        ))
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
          fontSize: 20.0),
      iconTheme: const IconThemeData(color: Colors.deepOrangeAccent),),
    scaffoldBackgroundColor: HexColor("222831"),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 70,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrangeAccent,
        backgroundColor:  HexColor("31363F"),
    unselectedItemColor: HexColor("6B728E")),
    iconTheme: const IconThemeData(color: Colors.deepOrangeAccent),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
    useMaterial3: true,
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18.0
        ))
);
