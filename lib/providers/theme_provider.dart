import 'package:flutter/material.dart';

class MyThemes{

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.orange,
    colorScheme: ColorScheme.light(),
    primaryColor: Colors.red
  );


  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.green,
    colorScheme: ColorScheme.light(),
    primaryColor: Colors.purple
  );

}