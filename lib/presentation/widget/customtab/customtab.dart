import 'package:flutter/material.dart';
import '../../../constant/app_textstyles/appTextStyle.dart';
import '../../../constant/app_theme/app_colors.dart';

class CustomTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomTab({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ]
              : null,
        ),
        child: Text(
          label,
          style: AppTextStyle.bodyMedium.copyWith(
            color: isSelected ? AppColors.greyDark : AppColors.grey,
          ),
        ),
      ),
    );
  }
}