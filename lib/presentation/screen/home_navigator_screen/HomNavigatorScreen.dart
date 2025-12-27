import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi/application/homepage/home_bloc.dart';
import 'package:mysivi/presentation/screen/Home/Home.dart';
import 'package:mysivi/presentation/screen/Offers/Offer.dart';
import 'package:mysivi/presentation/screen/Settings/Settings.dart';
import 'package:mysivi/presentation/widget/custombottomnavbar/custombottomnavbar.dart';

class HomeNavigatorBottom extends StatefulWidget {
  const HomeNavigatorBottom({super.key});

  @override
  State<HomeNavigatorBottom> createState() =>
      _HomeNavigatorBottomState();
}

class _HomeNavigatorBottomState extends State<HomeNavigatorBottom> {
  int selectedIndex = 0;

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeLoadChat(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        extendBody: true,

        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),

        body: _getScreen(selectedIndex),
      ),
    );
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const Offer();
      case 2:
        return const Settings();
      default:
        return const Home();
    }
  }
}
