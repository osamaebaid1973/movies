import 'package:flutter/material.dart';
import 'package:movies/core/app_theme/app_colors.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "ProfileTab",
        style: TextStyle(color: AppColors.textColor),
      ),
    );
  }
}
