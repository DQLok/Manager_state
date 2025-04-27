// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:manager_state/core/constants/app_colors.dart';
import 'package:manager_state/core/constants/app_dimensions.dart';
import 'package:manager_state/core/constants/app_fonts.dart';

enum AppTextStyple {
  inter_s14_t_black,
  inter_s14_el_black,
  inter_s14_l_black,
  inter_s14_r_black,
  inter_s14_m_black,
  inter_s14_sb_black,
  inter_s14_b_black,
  inter_s14_eb_black,
  inter_s14_bl_black,
}

extension TextStyleExtension on AppTextStyple {
  TextStyle textStyle(
      {required Color color,
      required String familyFont,
      required double size,
      FontWeight? weight,
      TextDecoration? decoration}) {
    return TextStyle(
        color: color,
        fontFamily: familyFont,
        fontSize: size,
        fontWeight: weight,
        decoration: decoration);
  }

  TextStyle get style {
    final interT = AppFonts.interThin.font;
    final interEL = AppFonts.interExtraLight.font;
    final interL = AppFonts.interLight.font;
    final interR = AppFonts.interRegular.font;
    final interM = AppFonts.interMedium.font;
    final interSB = AppFonts.interSemiBold.font;
    final interB = AppFonts.interBlack.font;
    final interEB = AppFonts.interExtraBold.font;
    final interBl = AppFonts.interBlack.font;

    switch (this) {
      case AppTextStyple.inter_s14_t_black:
        return textStyle(
            color: AppColors.black,
            familyFont: interT,
            size: AppDimensions.size14);
      case AppTextStyple.inter_s14_el_black:
        return textStyle(
            color: AppColors.black,
            familyFont: interEL,
            size: AppDimensions.size14);
      case AppTextStyple.inter_s14_l_black:
        return textStyle(
            color: AppColors.black,
            familyFont: interL,
            size: AppDimensions.size14);
      case AppTextStyple.inter_s14_r_black:
        return textStyle(
            color: AppColors.black,
            familyFont: interR,
            size: AppDimensions.size14);
      case AppTextStyple.inter_s14_m_black:
        return textStyle(
            color: AppColors.black,
            familyFont: interM,
            size: AppDimensions.size14);
      case AppTextStyple.inter_s14_sb_black:
        return textStyle(
            color: AppColors.black,
            familyFont: interSB,
            size: AppDimensions.size14);
      case AppTextStyple.inter_s14_b_black:
        return textStyle(
            color: AppColors.black,
            familyFont: interB,
            size: AppDimensions.size14);
      case AppTextStyple.inter_s14_eb_black:
        return textStyle(
            color: AppColors.black,
            familyFont: interEB,
            size: AppDimensions.size14);
      case AppTextStyple.inter_s14_bl_black:
        return textStyle(
            color: AppColors.black,
            familyFont: interBl,
            size: AppDimensions.size14);
    }
  }
}
