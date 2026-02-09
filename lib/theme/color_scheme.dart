import 'package:flutter/material.dart';

class AppColorScheme {
  final Color securityLight = Color.fromRGBO(214, 244, 243, 1);
  final Color securityMain = Color.fromRGBO(0, 158, 157, 1);
  final Color supportLight = Color.fromRGBO(238, 231, 248, 1);
  final Color supportMain = Color.fromRGBO(106, 77, 160, 1);
  final Color disableTextColor = Color.fromRGBO(148, 163, 184, 1);

  final Color success = Color.fromRGBO(22, 163, 74, 1);
  final Color successBorder = Color.fromRGBO(74, 222, 128, 1);
  final Color successLight = Color.fromRGBO(238, 253, 243, 1);

  final Color dangerLight = Color.fromRGBO(254, 226, 226, 1);
  final Color danger = Color.fromRGBO(220, 38, 38, 1);
  final Color dangerBorder = Color.fromRGBO(252, 165, 165, 1);

  final Color warning = Color.fromRGBO(245, 158, 11, 1);
  final Color warningBorder = Color.fromRGBO(253, 230, 138, 1);
  final Color warningLight = Color.fromRGBO(254, 243, 199, 1);

  static final Color _primary = Color.fromRGBO(26, 115, 232, 1);

  static final Color _primaryVariant = Color.fromRGBO(232, 241, 255, 1);
  static ColorScheme lightColorScheme = ColorScheme.light(
    // primary colors
    primary: _primary,
    onPrimary: Colors.white,
    primaryContainer: Color.fromRGBO(168, 200, 255, 1), //primary borders
    primaryFixed: _primaryVariant,

    onPrimaryContainer: Color.fromRGBO(226, 232, 240, 1),

    // surface colors
    surface: Color.fromRGBO(248, 250, 252, 1),
    onSurface: Color.fromRGBO(15, 23, 42, 1), //main text
    onSurfaceVariant: Color.fromRGBO(71, 85, 105, 1), //secondary text
    surfaceContainer: Color.fromRGBO(132, 134, 150, 1), //lighter secondary
    surfaceTint: Color.fromRGBO(241, 245, 249, 1),

    // Borders/outlines
    outline: Color.fromRGBO(226, 232, 240, 1),

    surfaceBright: Color.fromRGBO(255, 255, 255, 1), // White for cards/dialogs
    error: Color.fromRGBO(220, 38, 38, 1), //error text
    errorContainer: Color.fromRGBO(254, 226, 226, 1), //error bg

    onErrorContainer: Color.fromRGBO(252, 165, 165, 1), // error border
  );

  static ColorScheme darkColorScheme = ColorScheme.dark(
    primary: _primary,
    primaryFixed: Color.fromRGBO(51, 65, 85, 1),

    primaryContainer: Color.fromRGBO(51, 90, 160, 0.7),
    onPrimaryContainer: Color.fromRGBO(41, 50, 65, 1),

    surface: Color.fromRGBO(15, 23, 42, 1),
    onSurfaceVariant: Color.fromRGBO(148, 163, 184, 1),
    surfaceContainer: Color.fromRGBO(132, 134, 150, 1), //lighter secondary
    surfaceTint: Color.fromRGBO(30, 41, 59, 1), //elevated cards
    surfaceBright: Color.fromRGBO(
      30,
      41,
      59,
      1,
    ), // Brighter surfaces in dark mode for cards

    outline: Color.fromRGBO(41, 50, 65, 1), // Darker borders
    onPrimary: Colors.white,
  );
}
