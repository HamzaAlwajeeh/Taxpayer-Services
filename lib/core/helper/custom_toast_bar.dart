import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

void customToastBar({
  required BuildContext context,
  required String message,
  required IconData icon,
  required Color backgroundColor,
  required Color textColor,
}) {
  final accentColor = backgroundColor;

  return DelightToastBar(
    builder: (context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.itemsColor(context),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderColor(context)),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor(context),
              blurRadius: 28,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, size: 24, color: accentColor),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.bold14.copyWith(
                  color: AppColors.textBoldColor(context),
                  height: 1.45,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      );
    },
    position: DelightSnackbarPosition.bottom,
    autoDismiss: true,
    animationDuration: const Duration(milliseconds: 650),
  ).show(context);
}
