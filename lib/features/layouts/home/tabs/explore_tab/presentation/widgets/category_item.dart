import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/app_theme/app_text_style.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String? genreName;
  const CategoryItem({super.key, this.genreName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        border: Border.all(
          width: 2,
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        genreName ?? 'Action',
        style: AppTextStyle.getMediumTextStyle(
            color: isSelected
                ? AppColors.backgroundColor
                : AppColors.primaryColor),
      ),
    );
  }
}
