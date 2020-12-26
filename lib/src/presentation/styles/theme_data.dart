import '../../../src/presentation/styles/palettes.dart';

import '../../models/theme/theme_model.dart';
import 'package:flutter/material.dart';

PaletteColors dark = DarkPalette();
PaletteColors light = LightPalette();

final themesData = {
  ThemeModel.light: _createTheme(colors: light, isDark: false),
  ThemeModel.dark: _createTheme(colors: dark, isDark: true),
};

// Funcion que crea un ThemeData a partir de una paleta de colores
ThemeData _createTheme({PaletteColors colors, bool isDark}) {
  return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
          elevation: 0, centerTitle: true, color: colors.appBarColor),
      primaryColor: colors.primaryColor,
      primaryColorDark: colors.primaryColorDark,
      accentColor: colors.accentColor,
      toggleableActiveColor: colors.accentColor,
      backgroundColor: colors.backgroundColor,
      // Temas para iconos
      iconTheme: IconThemeData(color: colors.iconColor));
}
