import 'package:flutter/material.dart';

class AppColorScheme {
  final Color securityLight = Color.fromRGBO(214, 244, 243, 1);
  final Color securityMain = Color.fromRGBO(0, 158, 157, 1);
  final Color supportLight = Color.fromRGBO(238, 231, 248, 1);
  final Color supportMain = Color.fromRGBO(106, 77, 160, 1);
  final Color disableTextColor = Color.fromRGBO(148, 163, 184, 1);
  final Color success = Color.fromRGBO(22, 163, 74, 1);


  static final Color _primary = Color.fromRGBO(26, 115, 232, 1);



  static final Color _primaryVariant = Color.fromRGBO(232, 241, 255, 1);
  static ColorScheme lightColorScheme = ColorScheme.light(
    surface: Color.fromRGBO(248, 250, 252, 1),
    primary: _primary,
    onPrimary: Colors.white,
    primaryFixed: _primaryVariant,
    onPrimaryContainer: Color.fromRGBO(226, 232, 240, 1),

    onSurface: Color.fromRGBO(15, 23, 42, 1),
    surfaceBright: Color.fromRGBO(71, 85, 105, 1),
  );

  static ColorScheme darkColorScheme = ColorScheme.dark(
    primary: _primary,
    onPrimary: Colors.white,
  );
}
