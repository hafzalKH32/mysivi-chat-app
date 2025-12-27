import 'package:flutter/material.dart';
import 'package:mysivi/constant/app_textstyles/appTextStyle.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';
import 'package:mysivi/core/model/message_model/message_model.dart';
import 'package:mysivi/presentation/widget/customavatar/customavatar.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment:
        message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!message.isMe)
                const UserAvatar(
                  initial: 'A',
                  color: AppColors.primaryBlue,
                  size: 32,
                ),
              if (!message.isMe) const SizedBox(width: 8),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: message.isMe
                        ? AppColors.primaryBlue
                        : AppColors.greyLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    message.text,
                    style: AppTextStyle.bodyMedium.copyWith(
                      color:
                      message.isMe ? AppColors.white : AppColors.greyDark,
                    ),
                  ),
                ),
              ),
              if (message.hasHeart) ...[
                const SizedBox(width: 8),
                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryPink,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: AppColors.white,
                    size: 16,
                  ),
                ),
              ],
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 4,
              left: message.isMe ? 0 : 40,
              right: message.isMe ? 0 : 0,
            ),
            child: Text(
              message.time,
              style: AppTextStyle.caption.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
