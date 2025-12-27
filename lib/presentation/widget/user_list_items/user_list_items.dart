import 'package:flutter/material.dart';
import 'package:mysivi/constant/app_textstyles/appTextStyle.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';
import 'package:mysivi/core/model/user_model/user_model.dart';
import 'package:mysivi/presentation/widget/customavatar/customavatar.dart';

class UserListItem extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserListItem({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            UserAvatar(
              initial: user.name[0],
              color: _getColorFromString(user.avatarColor),
              showOnline: user.isOnline,
              size: 50,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: AppTextStyle.bodyLargeBold.copyWith(
                      color: AppColors.greyDark,
                    ),
                  ),
                  if (user.lastMessageTime != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      user.lastMessageTime!,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorFromString(String colorStr) {
    switch (colorStr) {
      case 'blue':
        return AppColors.primaryBlue;
      case 'green':
        return AppColors.primaryGreen;
      case 'pink':
        return AppColors.primaryPink;
      default:
        return AppColors.primaryBlue;
    }
  }
}
