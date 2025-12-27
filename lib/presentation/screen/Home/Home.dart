import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mysivi/application/homepage/home_bloc.dart';
import 'package:mysivi/constant/app_constant/constant.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';
import 'package:mysivi/core/model/common_model/commonmodel.dart';
import 'package:mysivi/core/model/user_model/user_model.dart';
import 'package:mysivi/presentation/screen/Home/widgets/chat_screen/chat_screen.dart';
import 'package:mysivi/presentation/widget/customtab/customtab.dart';
import 'package:mysivi/presentation/widget/user_list_items/user_list_items.dart';

import '../../widget/chat_history_item/chat_history_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 0;

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeClear(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.grey.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTab(
                        label: 'Users',
                        isSelected: _selectedTab == 0,
                        onTap: () => setState(() => _selectedTab = 0),
                      ),
                      const SizedBox(width: 10),
                      CustomTab(
                        label: 'Chat History',
                        isSelected: _selectedTab == 1,
                        onTap: () => setState(() => _selectedTab = 1),
                      ),
                    ],
                  ),
                ),

                Divider().paddingSymmetric(horizontal: 10),

                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return Expanded(
                      child: _selectedTab == 0
                          ? _buildUsersList(users: state.chatList) // users UI
                          : _buildChatHistoryList(
                              chatHistory: state.chatList,
                            ), // chat history UI
                    );
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: FloatingActionButton(
                  onPressed: () {
                    AppConstants.showCustomSnackbar(
                      title: "Success",
                      message: "User added",
                    );
                  },
                  elevation: 3,
                  backgroundColor: AppColors.primaryBlue,
                  // Change if needed
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add, color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsersList({required List<CommentModel> users}) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final comment = users[index];
        final user = User(
          id: comment.user.id.toString(),
          name: comment.user.fullName,
          lastMessage: comment.body,
          lastMessageTime: "",
          // optional: timestamp
          avatarColor: "green",
        );

        return UserListItem(
          user: user,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChatScreen(user: user, initialMessage: comment.body),
              ),
            );
          },
        );
      },
    );
  }

  /// Build Chat History tab from CommentModel
  Widget _buildChatHistoryList({required List<CommentModel> chatHistory}) {
    return ListView.builder(
      itemCount: chatHistory.length,
      itemBuilder: (context, index) {
        final comment = chatHistory[index];

        final user = User(
          id: comment.user.id.toString(),
          name: comment.user.fullName,
          lastMessage: comment.body,
          lastMessageTime: "",
          avatarColor: "green",
        );

        return ChatHistoryItem(
          user: user,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChatScreen(user: user, initialMessage: comment.body),
              ),
            );
          },
        );
      },
    );
  }
}
