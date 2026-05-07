import 'package:flutter/material.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class SplashLoadingIndicator extends StatefulWidget {
  const SplashLoadingIndicator({super.key});

  @override
  State<SplashLoadingIndicator> createState() => _SplashLoadingIndicatorState();
}

class _SplashLoadingIndicatorState extends State<SplashLoadingIndicator>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).Loading,
          style: TextStyles.bold20.copyWith(
            color: AppColors.textRedColor(context),
          ),
        ),
        const SizedBox(height: AppSpacing.s16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.s40 * 3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.radius50),
            child: LinearProgressIndicator(
              minHeight: 4,
              backgroundColor: AppColors.borderColor(context),
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.primaryColor(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
