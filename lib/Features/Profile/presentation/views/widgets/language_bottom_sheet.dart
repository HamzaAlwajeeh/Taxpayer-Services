import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/generated/l10n.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLang = AppSettings.localeSignal.watch(context).languageCode;
    final isArabic = currentLang == AppConstants.kArabicLang;
    final l10n = S.of(context);

    return CupertinoActionSheet(
      title: Text(
        l10n.Language,
        style: TextStyle(
          color: AppColors.textBoldColor(context),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: isArabic ? 'Cairo' : null,
        ),
      ),
      message: Text(
        l10n.SelectLanguageMessage,
        style: TextStyle(
          color: AppColors.textSecondaryColor(context),
          fontSize: 14,
          fontFamily: isArabic ? 'Cairo' : null,
        ),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            AppSettings.changeLanguage(AppConstants.kArabicLang);
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l10n.Arabic,
                style: TextStyle(
                  color: isArabic
                      ? AppColors.primaryColor(context)
                      : AppColors.textBoldColor(context),
                  fontWeight: isArabic ? FontWeight.bold : FontWeight.normal,
                  fontFamily: 'Cairo',
                ),
              ),
              if (isArabic) ...[
                const SizedBox(width: 8),
                Icon(
                  CupertinoIcons.check_mark,
                  color: AppColors.primaryColor(context),
                  size: 18,
                ),
              ],
            ],
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            AppSettings.changeLanguage(AppConstants.kEnglishLang);
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l10n.English,
                style: TextStyle(
                  color: !isArabic
                      ? AppColors.primaryColor(context)
                      : AppColors.textBoldColor(context),
                  fontWeight: !isArabic ? FontWeight.bold : FontWeight.normal,
                  fontFamily: isArabic ? 'Cairo' : null,
                ),
              ),
              if (!isArabic) ...[
                const SizedBox(width: 8),
                Icon(
                  CupertinoIcons.check_mark,
                  color: AppColors.primaryColor(context),
                  size: 18,
                ),
              ],
            ],
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          l10n.Cancel,
          style: TextStyle(
            color: AppColors.primaryColor(context),
            fontFamily: isArabic ? 'Cairo' : null,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
