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
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: colorScheme.outline, // Use outline instead of custom color
        ),
        filled: true,
        fillColor: colorScheme
            .surfaceContainerHighest, // Proper fill color for both themes

        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.error,
        ),

        // Focused state
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2.0, // Slightly thicker when focused
          ),
        ),

        // Enabled state
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: colorScheme
                .surfaceBright, // Use outline, not onPrimaryContainer
            width: 1.0,
          ),
        ),

        // Error state
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: colorScheme.error, width: 1.0),
        ),

        // Focused error state
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: colorScheme.error, width: 2.0),
        ),

        // Disabled state
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: colorScheme.outlineVariant, // Lighter for disabled
            width: 1.0,
          ),
        ),

        // Content padding for consistency
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
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
