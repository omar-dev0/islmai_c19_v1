import 'package:flutter/material.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.amber,
    textTheme: TextTheme(
      labelLarge: TextStyle(fontSize: 24),
      labelMedium: TextStyle(fontSize: 20),
      labelSmall: TextStyle(fontSize: 16),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
    ),
    iconTheme: IconThemeData(),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.amber,
    textTheme: TextTheme(
      labelLarge: TextStyle(fontSize: 24),
      labelMedium: TextStyle(fontSize: 20),
      labelSmall: TextStyle(fontSize: 16),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
    ),
    iconTheme: IconThemeData(),
  );
}
