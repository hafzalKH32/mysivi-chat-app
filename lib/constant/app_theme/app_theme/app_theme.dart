import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';

class AppTheme {

  static ThemeData base(Color seedColor) {
    final textTheme = GoogleFonts.montserratTextTheme();

    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      textTheme: textTheme,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  // Pink Theme (Chat Screen)
  static final ThemeData pinkTheme = base(AppColors.primaryPink);

  // Blue Theme (User List)
  static final ThemeData blueTheme = base(AppColors.primaryBlue);

  // Green Theme (Chat History)
  static final ThemeData greenTheme = base(AppColors.primaryGreen);
}
