import 'package:billflow/theme/color_scheme.dart';
import 'package:billflow/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      scaffoldBackgroundColor: colorScheme.surface,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50.h)),
          splashFactory: InkSparkle.splashFactory,
          textStyle: WidgetStatePropertyAll(
            Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Colors.white),
          ),
          backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(colorScheme.primary),
          textStyle: WidgetStatePropertyAll(
            Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColorScheme().disableTextColor,
        ),
        filled: true,
        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.error,
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: colorScheme.onPrimaryContainer),
        ),
      ),
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
