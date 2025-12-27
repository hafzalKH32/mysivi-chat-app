import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysivi/constant/app_icons/app_icon.dart';
import 'package:mysivi/constant/app_theme/app_colors.dart';
import 'package:mysivi/presentation/screen/home_navigator_screen/HomNavigatorScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      Get.off(() => const HomeNavigatorBottom());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon
              Image.asset(
                AppIcon.appLogo,
                width: 160,
                height: 160,
              ),

              const SizedBox(height: 24),

              // App Name (optional)
              Text(
                "My Chat App",
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
