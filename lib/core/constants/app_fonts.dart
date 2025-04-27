enum AppFonts {
  interThin,
  interExtraLight,
  interLight,
  interRegular,
  interMedium,
  interSemiBold,
  interBold,
  interExtraBold,
  interBlack
}

extension AppFontsExtension on AppFonts {
  String get font {
    switch (this) {
      case AppFonts.interThin:
        return "Inter_Thin";
      case AppFonts.interExtraLight:
        return "Inter_ExtraLight";
      case AppFonts.interLight:
        return "Inter_Light";
      case AppFonts.interRegular:
        return "Inter_Regular";
      case AppFonts.interMedium:
        return "Inter_Medium";
      case AppFonts.interSemiBold:
        return "Inter_SemiBold";
      case AppFonts.interBold:
        return "Inter_Bold";
      case AppFonts.interExtraBold:
        return "Inter_ExtraBold";
      case AppFonts.interBlack:
        return "Inter_Black";
    }
  }
}
