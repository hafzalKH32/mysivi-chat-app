import 'package:flutter/material.dart';
import 'package:mysivi/constant/app_textstyles/appTextStyle.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.white,
              child: Row(
                children: [
                  Text(
                    'Offers',
                    style: AppTextStyle.h2Bold.copyWith(
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_offer_outlined,
                      size: 80,
                      color: AppColors.grey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No Offers Available',
                      style: AppTextStyle.bodyLargeBold.copyWith(
                        color: AppColors.greyDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Check back later for exciting deals',
                      style: AppTextStyle.bodyMedium.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}