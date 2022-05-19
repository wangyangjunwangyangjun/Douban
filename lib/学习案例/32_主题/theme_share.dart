import 'package:flutter/material.dart';

class HYAppTheme {
  static final ThemeData normalTheme = ThemeData (
    primarySwatch: Colors.blue,
    splashColor: Colors.transparent,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 20, color: Colors.purple),
    ),
  );
  static final ThemeData darkTheme = ThemeData (
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 20, color: Colors.green),
    ),
  );
}