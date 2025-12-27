import 'package:flutter/material.dart';
import 'package:mysivi/constant/app_textstyles/appTextStyle.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
                    'Settings',
                    style: AppTextStyle.h2Bold.copyWith(
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
            ),
            // Settings List
            Expanded(
              child: ListView(
                children: [
                  _SettingItem(
                    icon: Icons.person_outline,
                    title: 'Profile',
                    onTap: () {},
                  ),
                  _SettingItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    onTap: () {},
                  ),
                  _SettingItem(
                    icon: Icons.lock_outline,
                    title: 'Privacy',
                    onTap: () {},
                  ),
                  _SettingItem(
                    icon: Icons.palette_outlined,
                    title: 'Appearance',
                    onTap: () {},
                  ),
                  _SettingItem(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  _SettingItem(
                    icon: Icons.info_outline,
                    title: 'About',
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPink,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Logout',
                        style: AppTextStyle.bodyLargeBold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
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

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        margin: const EdgeInsets.only(bottom: 1),
        color: AppColors.white,
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primaryBlue,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.greyDark,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.grey,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}