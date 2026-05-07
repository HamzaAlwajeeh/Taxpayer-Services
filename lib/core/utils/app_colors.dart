import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';

abstract class AppColors {
  static bool isDarkMode([BuildContext? context]) {
    if (context != null) {
      return Theme.of(context).brightness == Brightness.dark;
    }
    return AppSettings.themeModeSignal.value == ThemeMode.dark;
  }

  static Color primaryColor([BuildContext? context]) =>
      isDarkMode(context) ? const Color(0xffAA1212) : const Color(0xffAA1212);
  static Color secondaryColor([BuildContext? context]) =>
      isDarkMode(context) ? const Color(0xffE4C58F) : const Color(0xffE4C58F);
  static Color scaffoldBackgroundColor([bool? isDark, BuildContext? context]) =>
      (isDark ?? isDarkMode(context))
          ? const Color(0xff101828)
          : const Color(0xffF9FAFB);
  static Color textPrimaryColor([BuildContext? context]) =>
      isDarkMode(context) ? const Color(0xffFFFFFF) : const Color(0xff757575);
  static Color textSecondaryColor([BuildContext? context]) =>
      isDarkMode(context)
          ? const Color(0xffA6A4A4)
          : const Color(0xff463F3F).withValues(alpha: 0.60);
  static Color textBoldColor([BuildContext? context]) =>
      isDarkMode(context) ? const Color(0xffFFFFFF) : const Color(0xff463F3F);
  static Color textRedColor([BuildContext? context, bool isFixed = false]) =>
      isDarkMode(context)
          ? isFixed
              ? const Color(0xff7F1D1D)
              : const Color(0xffFFFFFF)
          : const Color(0xff7F1D1D);
  static Color textFeilColor([BuildContext? context]) =>
      isDarkMode(context) ? const Color(0xff171F2F) : const Color(0xffF8FAFC);
  static Color itemsColor([BuildContext? context]) =>
      isDarkMode(context) ? const Color(0xff171F2F) : const Color(0xffFFFFFF);
  static Color borderColor([BuildContext? context]) =>
      isDarkMode(context) ? const Color(0xff212838) : const Color(0xffE7E6E9);
  static Color red() => const Color(0xffE7040E);
  static Color customGreen() => const Color(0xff2A9D90);
  static Color customOrange() => const Color(0xffE76E50);
  static Color customBlue() => const Color(0xff275ECD);
  static Color customRed() => const Color(0xffFFD4D4);
  static Color white() => const Color(0xffFFFFFF);
}
