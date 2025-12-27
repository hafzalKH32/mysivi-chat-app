import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';

class AppConstants {
  ///VALUES

  static const String baseUrl = 'https://dummyjson.com/comments?limit=10';
  static const String dictionaryUrl =
      'https://api.dictionaryapi.dev/api/v2/entries/en/hello';

  ///WIDGETS
  static void showCustomSnackbar({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.BOTTOM,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      backgroundColor: AppColors.greyLight.withOpacity(0.9),
      colorText: AppColors.greyDark,
      borderRadius: 12,
      margin: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 300),
      duration: duration,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      snackStyle: SnackStyle.FLOATING,
      mainButton: TextButton(
        onPressed: () => Get.back(), // closes the snackbar
        child: const Icon(Icons.close, color: AppColors.greyDark),
      ),
    );
  }
}
