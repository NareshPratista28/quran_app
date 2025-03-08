import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF6B4EFF);
  static const Color secondary = Color(0xFFA19CC5);
  static const Color background = Color(0xFF040C23);
  static const Color cardBackground = Color(0xFF121931);
  static const Color textPrimary = Colors.white;
  static const Color buttonOrange = Color(0xFFF9B091);
}

class AppTextStyles {
  static TextStyle splashHeading = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static TextStyle splashSubHeading = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );
  static TextStyle splashButton = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.background,
  );
}

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
  );
}
