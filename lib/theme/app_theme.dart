import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(
      secondary: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
