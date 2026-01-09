import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const headingXL = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w800,
    height: 1.2,
    color: AppColors.textDark,
  );

  static const heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const body = TextStyle(
    fontSize: 14,
    color: AppColors.textLight,
  );

  static const caption = TextStyle(
    fontSize: 10,
    color: AppColors.textLight,
  );
}
