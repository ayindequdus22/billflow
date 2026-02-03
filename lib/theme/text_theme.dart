import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme buildTextTheme({required ColorScheme colorScheme}) {
    return TextTheme(
      headlineLarge: GoogleFonts.instrumentSans(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      headlineSmall: GoogleFonts.instrumentSans(
                fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      bodyLarge: GoogleFonts.instrumentSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      bodyMedium: GoogleFonts.instrumentSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
      bodySmall: GoogleFonts.instrumentSans(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
    );
  }
}
