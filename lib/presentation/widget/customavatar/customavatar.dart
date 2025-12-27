import 'package:flutter/material.dart';
import 'package:mysivi/constant/app_textstyles/appTextStyle.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';

class UserAvatar extends StatelessWidget {
  final String initial;
  final Color color;
  final bool showOnline;
  final double size;

  const UserAvatar({
    super.key,
    required this.initial,
    required this.color,
    this.showOnline = false,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              initial,
              style: AppTextStyle.bodyLargeBold.copyWith(
                color: AppColors.white,
                fontSize: size * 0.4,
              ),
            ),
          ),
        ),
        if (showOnline)
          Positioned(
            right: 2,
            bottom: 2,
            child: Container(
              width: size * 0.24,
              height: size * 0.24,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}