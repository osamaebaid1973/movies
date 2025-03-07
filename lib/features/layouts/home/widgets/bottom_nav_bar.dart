import 'package:flutter/material.dart';
import 'package:movies/core/app_sizes/app_font_size.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/constants/app_images_paths.dart';

class BottomNavBar extends StatelessWidget {
  final String nameIcon;
  final bool isSelected;
  final VoidCallback onPressed;

  const BottomNavBar({
    super.key,
    required this.nameIcon,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ImageIcon(
        AssetImage(
          '${IconPath.icon}/$nameIcon.png',
        ),
        color: isSelected ? AppColors.primaryColor : AppColors.textColor,
        size:  AppFontSize.s36,
      ),
    );
  }
}
