import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 106, 37, 217);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectorColor;

  AppTheme({this.selectorColor = 0})
      : assert(selectorColor >= 0 && selectorColor <= _colorThemes.length - 1,
            'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectorColor]
        //brightness: Brightness.dark);
        );
  }
}
