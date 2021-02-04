import 'package:flutter/material.dart';

class OurTheme {
  Color _lightJacarta = Color.fromARGB(255, 65, 32, 95);
  Color _lightGreen = Color.fromARGB(255, 189, 232, 157);
  Color _darkGrey = Color.fromARGB(255, 25, 31, 43);
  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: _lightJacarta,
      primaryColor: _darkGrey,
      accentColor: _darkGrey,
      secondaryHeaderColor: _lightJacarta,
      hintColor: _darkGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: _darkGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: _darkGrey),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: _darkGrey,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        minWidth: 150,
        height: 40.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
