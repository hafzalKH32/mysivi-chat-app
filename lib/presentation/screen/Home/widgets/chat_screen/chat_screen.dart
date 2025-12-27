import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi/application/homepage/home_bloc.dart';
import 'package:mysivi/constant/app_textstyles/appTextStyle.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';
import 'package:mysivi/core/model/message_model/message_model.dart';
import 'package:mysivi/core/model/user_model/user_model.dart';
import 'package:mysivi/domain/repository/chat_repo/Chat_repository.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  final String initialMessage;

  const ChatScreen({
    super.key,
    required this.user,
    required this.initialMessage,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  final ChatRepository chatRepo = ChatRepository(); // repository instance

  @override
  void initState() {
    super.initState();
    // First message from the other user
    _messages.add(Message(text: widget.initialMessage, time: '', isMe: false));
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        Message(text: _controller.text.trim(), time: '', isMe: true),
      );
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.greyDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            _buildAvatar(widget.user.name[0], AppColors.primaryBlue),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: AppTextStyle.bodyLargeBold.copyWith(
                    color: AppColors.greyDark,
                  ),
                ),
                Text(
                  'Online',
                  style: AppTextStyle.bodySmall.copyWith(
                    color: AppColors.primaryGreen,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              reverse: false,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];

                return Row(
                  mainAxisAlignment: message.isMe
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (!message.isMe) ...[
                      _buildAvatar(widget.user.name[0], AppColors.primaryBlue),
                      const SizedBox(width: 8),
                    ],
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: message.isMe
                              ? AppColors.primaryBlue
                              : AppColors.greyLight,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(18),
                            topRight: const Radius.circular(18),
                            bottomLeft: Radius.circular(message.isMe ? 18 : 0),
                            bottomRight: Radius.circular(message.isMe ? 0 : 18),
                          ),
                        ),
                        child: Wrap(
                          spacing: 4,
                          runSpacing: 2,
                          children: message.text
                              .split(' ')
                              .map(
                                (word) => GestureDetector(
                                  onLongPress: () {
                                    context.read<HomeBloc>().add(
                                      HomeWordSearch(word: word),
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Searching definition for "$word"',
                                        ),
                                        backgroundColor: AppColors.primaryBlue,
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    word,
                                    style: AppTextStyle.bodyMedium.copyWith(
                                      color: message.isMe
                                          ? AppColors.white
                                          : AppColors.greyDark,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    if (message.isMe) const SizedBox(width: 8),
                    if (message.isMe)
                      _buildAvatar('Y', AppColors.primaryGreen), // Me avatar
                  ],
                );
              },
            ),
          ),

          // Input Bar
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: AppTextStyle.bodyMedium.copyWith(
                          color: AppColors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                      style: AppTextStyle.bodyMedium,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build circular avatar
  Widget _buildAvatar(String initial, Color color) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: color,
      child: Text(
        initial.toUpperCase(),
        style: const TextStyle(color: AppColors.white),
      ),
    );
  }
}
