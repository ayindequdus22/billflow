import 'package:billflow/theme/color_scheme.dart';
import 'package:billflow/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData _buildTheme(
    ColorScheme colorScheme,
    BuildContext context,
    TextTheme textTheme,
  ) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
    );
  }

  static ThemeData lightMode(BuildContext context) {
    return _buildTheme(
      AppColorScheme.lightColorScheme,
      context,
      AppTextTheme.buildTextTheme(colorScheme: AppColorScheme.lightColorScheme),
    );
  }

  static ThemeData darkMode(BuildContext context) {
    return _buildTheme(
      AppColorScheme.darkColorScheme,
      context,
      AppTextTheme.buildTextTheme(colorScheme: AppColorScheme.darkColorScheme),
    );
  }
}
