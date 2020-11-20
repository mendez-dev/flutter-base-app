import 'package:flutter/material.dart';

class ThemeRepository {
  ThemeRepository(this.theme);

  String theme;

  ThemeData ligth = ThemeData.light().copyWith(
      primaryColor: Colors.indigo,
      primaryColorDark: Colors.indigo[600],
      primaryColorLight: Colors.indigo[400],
      inputDecorationTheme:
          InputDecorationTheme(labelStyle: TextStyle(color: Colors.grey)),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)));

  ThemeData dark = ThemeData.dark();

  ThemeData getTheme() {
    switch (theme) {
      case "ligth":
        return ligth;
        break;
      case "dark":
        return dark;
        break;
      default:
        return ligth;
    }
  }
}
