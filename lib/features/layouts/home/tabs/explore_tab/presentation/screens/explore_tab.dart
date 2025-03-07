import 'package:flutter/material.dart';
import 'package:movies/core/app_theme/app_colors.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "ExploreScreen",
        style: TextStyle(color: AppColors.textColor),
      ),
    );
  }
}
