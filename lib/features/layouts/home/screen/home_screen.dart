import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/presentation/screens/explore_tab.dart';
import 'package:movies/features/layouts/home/tabs/home_tab/presentation/screens/home_tab.dart';
import 'package:movies/features/layouts/home/tabs/profile_tab/presentation/screens/profile_tab.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/presentation/screens/search_tab.dart';
import 'package:movies/features/layouts/home/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          tabs[currentIndex],
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.greyColor,
              ),
              // padding: const EdgeInsets.symmetric(vertical: AppPaddingSize.p16),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavBar(
                    nameIcon: "home",
                    isSelected: currentIndex == 0,
                    onPressed: () => onNavBarItemPressed(0),
                  ),
                  BottomNavBar(
                    nameIcon: "search",
                    isSelected: currentIndex == 1,
                    onPressed: () => onNavBarItemPressed(1),
                  ),
                  BottomNavBar(
                    nameIcon: "explore",
                    isSelected: currentIndex == 2,
                    onPressed: () => onNavBarItemPressed(2),
                  ),
                  BottomNavBar(
                    nameIcon: "profile",
                    isSelected: currentIndex == 3,
                    onPressed: () => onNavBarItemPressed(3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    ExploreTab(),
    ProfileTab(),
  ];

  // this function make setState
  void onNavBarItemPressed(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
