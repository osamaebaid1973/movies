import 'package:flutter/material.dart';
import 'package:movies/core/app_theme/app_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "HomeTab",
        style: TextStyle(color: AppColors.textColor),
      ),
    );
  }
}
