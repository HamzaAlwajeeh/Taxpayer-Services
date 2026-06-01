import 'package:flutter/material.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class HomeMessageView extends StatelessWidget {
  const HomeMessageView({
    super.key,
    required this.message,
    required this.actionLabel,
    required this.onPressed,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.s24),
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.28),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyles.semiBold16.copyWith(
            color: AppColors.textPrimaryColor(context),
          ),
        ),
        const SizedBox(height: AppSpacing.s16),
        Center(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor(context),
              foregroundColor: AppColors.white(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radius12),
              ),
            ),
            child: Text(actionLabel),
          ),
        ),
      ],
    );
  }
}
