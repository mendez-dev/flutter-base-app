import 'package:flutter/material.dart';
// Paletas de colores para aplicar en los temas de la aplicacion

// Creamos una clase abstracta que definira los tipos de colores
abstract class PaletteColors {
  Color primaryColor;
  Color primaryColorDark;
  Color accentColor;
  Color iconColor;
  Color backgroundColor;
  Color appBarColor;
}

class DarkPalette implements PaletteColors {
  @override
  Color accentColor = Colors.indigoAccent;

  @override
  Color primaryColor = Colors.indigo;

  @override
  Color iconColor = Colors.white;

  @override
  Color backgroundColor = Color(0xff303030);

  @override
  Color primaryColorDark = Colors.indigo[900];

  @override
  Color appBarColor = Color(0xff212121);
}

class LightPalette implements PaletteColors {
  @override
  Color accentColor = Colors.indigoAccent;

  @override
  Color primaryColor = Colors.indigo;

  @override
  Color iconColor = Colors.indigo;

  @override
  Color backgroundColor = Color(0xffF9FAFF);

  @override
  Color primaryColorDark = Colors.indigo[900];

  @override
  Color appBarColor = Colors.indigo;
}
