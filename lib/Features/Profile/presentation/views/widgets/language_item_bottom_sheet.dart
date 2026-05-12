import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

Widget languageItemBottomSheet({
  required BuildContext context,
  required String title,
  required String badgeText,
  required bool isActive,
  required String langCode,
}) {
  final activeColor = AppColors.textRedColor(context);

  return GestureDetector(
    onTap: () {
      AppSettings.changeLanguage(langCode);
      Navigator.pop(context);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border:
            isActive
                ? Border.all(color: activeColor, width: 1.5)
                : Border.all(color: Colors.transparent),
      ),
      child: Row(
        spacing: AppSpacing.s10,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor(context),
            ),
            child: Center(
              child: Text(
                badgeText,
                style: TextStyles.bold18.copyWith(color: AppColors.textRedColor(context)),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.bold18.copyWith(color: activeColor),
              ),
              const SizedBox(height: 4),
              Text(
                isActive ? S.of(context).Active : S.of(context).Disabled,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondaryColor(context),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
