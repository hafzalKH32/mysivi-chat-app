import 'package:flutter/material.dart';
import 'package:mysivi/constant/app_textstyles/appTextStyle.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';
import 'package:mysivi/core/model/user_model/user_model.dart';
import 'package:mysivi/presentation/widget/customavatar/customavatar.dart';

class ChatHistoryItem extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const ChatHistoryItem({
    super.key,
    required this.user,
    required this.onTap,
  });

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
              color: AppColors.primaryGreen,
              size: 50,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          user.name,
                          style: AppTextStyle.bodyLargeBold.copyWith(
                            color: AppColors.greyDark,
                          ),
                        ),
                      ),
                      if (user.lastMessageTime != null)
                        Text(
                          user.lastMessageTime!,
                          style: AppTextStyle.bodySmall.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          user.lastMessage ?? '',
                          style: AppTextStyle.bodySmall.copyWith(
                            color: AppColors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (user.unreadCount != null && user.unreadCount! > 0)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${user.unreadCount}',
                            style: AppTextStyle.captionBold.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
