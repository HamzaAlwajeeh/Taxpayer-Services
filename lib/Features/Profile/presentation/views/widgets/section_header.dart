import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.iconPath});

  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white(),
        border: Border.all(color: AppColors.borderColor(context)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.s10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor(context).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
            ),
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              colorFilter: ColorFilter.mode(
                AppColors.textRedColor(context),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyles.bold18.copyWith(
              color: AppColors.textRedColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
