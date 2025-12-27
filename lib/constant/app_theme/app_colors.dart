import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryPink = Color(0xFFE91E63);
  static const Color primaryBlue = Color(0xFF3F51B5);
  static const Color primaryGreen = Color(0xFF4CAF50);

  static const Color greyDark = Color(0xFF2E2E2E);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyLight = Color(0xFFF3F3F3);
  static const Color white = Colors.white;

  static const LinearGradient userListGradient = LinearGradient(
    colors: [
      Color(0xFF3F51B5),
      Color(0xFF7C4DFF), // Violet
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient chatScreenGradient = LinearGradient(
    colors: [
      Color(0xFFE91E63),
      Color(0xFFD1A3FF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient greenBubbleGradient = LinearGradient(
    colors: [
      Color(0xFF4CAF50),
      Color(0xFF9CCC65),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
