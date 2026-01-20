import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme buildTextTheme({required ColorScheme colorScheme}) {
    return TextTheme(
      headlineLarge: GoogleFonts.instrumentSans(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.instrumentSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.instrumentSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
