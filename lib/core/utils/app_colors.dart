import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';

abstract class AppColors {
  static bool get isDarkMode =>
      AppSettings.themeModeSignal.value == ThemeMode.dark;

  static Color primaryColor() =>
      isDarkMode ? const Color(0xffAA1212) : const Color(0xffAA1212);
  static Color secondaryColor() =>
      isDarkMode ? const Color(0xffE4C58F) : const Color(0xffE4C58F);
  static Color scaffoldBackgroundColor([bool? isDark]) =>
      (isDark ?? isDarkMode)
          ? const Color(0xff101828)
          : const Color(0xffF9FAFB);
  static Color textPrimaryColor() =>
      isDarkMode ? const Color(0xffFFFFFF) : const Color(0xff757575);
  static Color textSecondaryColor() =>
      isDarkMode
          ? const Color(0xffA6A4A4)
          : const Color(0xff463F3F).withValues(alpha: 0.60);
  static Color textBoldColor() =>
      isDarkMode ? const Color(0xffFFFFFF) : const Color(0xff463F3F);
  static Color textRedColor() =>
      isDarkMode ? const Color(0xffFFFFFF) : const Color(0xff7F1D1D);
  static Color textFeilColor() =>
      isDarkMode ? const Color(0xffF8FAFC) : const Color(0xffF8FAFC);
  static Color itemsColor() =>
      isDarkMode ? const Color(0xff171F2F) : const Color(0xffFFFFFF);
  static Color borderColor() =>
      isDarkMode ? const Color(0xff212838) : const Color(0xffE7E6E9);
  static Color red() => const Color(0xffE7040E);
  static Color customGreen() => const Color(0xff2A9D90);
  static Color customOrange() => const Color(0xffE76E50);
  static Color customBlue() => const Color(0xff275ECD);
  static Color customRed() => const Color(0xffFFD4D4);
  static Color white() => const Color(0xffFFFFFF);
}
