import 'package:flutter/material.dart';
import 'package:manager_state/core/constants/app_colors.dart';
import 'package:manager_state/core/constants/app_dimensions.dart';

ThemeData getConfigTheme() {
  return ThemeData(
      fontFamily: 'Inter',
      primaryColor: AppColors.primary,
      splashColor: AppColors.primary,
      cardTheme: CardTheme(
          color: AppColors.backgroundWhite,
          shadowColor: AppColors.black,
          elevation: AppDimensions.size5));
}
