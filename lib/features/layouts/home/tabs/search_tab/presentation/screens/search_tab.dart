import 'package:flutter/material.dart';
import 'package:movies/core/app_theme/app_colors.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "SearchTab",
        style: TextStyle(color: AppColors.textColor),
      ),
    );
  }
}
