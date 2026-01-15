import 'package:flutter/material.dart';

class AppColorScheme {
  static final Color _primary = Color.fromRGBO(26, 115, 232, 1);
  
  static ColorScheme lightColorScheme = ColorScheme.light(primary: _primary,onPrimary: Colors.white,
  onPrimaryContainer: Color.fromRGBO(226, 232, 240, 1),
  
  onSurface:Color.fromRGBO(15, 23, 42, 1), );

  static ColorScheme darkColorScheme = ColorScheme.dark(primary: _primary);
}
