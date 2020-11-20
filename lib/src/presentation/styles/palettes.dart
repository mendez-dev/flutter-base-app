import 'package:flutter/material.dart';
// Paletas de colores para aplicar en los temas de la aplicacion

// Creamos una clase abstracta que definira los tipos de colores
abstract class PaletteColors {
  Color primaryColor;
  Color accentColor;
  Color iconColor;
}

class DarkPalette implements PaletteColors {
  @override
  Color accentColor = Colors.redAccent;

  @override
  Color primaryColor = Colors.black;

  @override
  Color iconColor = Colors.redAccent;
}

class LightPalette implements PaletteColors {
  @override
  Color accentColor = Colors.indigoAccent;

  @override
  Color primaryColor = Colors.white;

  @override
  Color iconColor = Colors.indigoAccent;
}
