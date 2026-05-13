import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class InstructionsHeader extends StatelessWidget {
  const InstructionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.s20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff820005),
            AppColors.primaryColor(context)
          ],
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor(context).withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.s12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
            ),
            child: SvgPicture.asset(
              Assets.assetsIconsLampCharge,
              width: 28,
              height: 28,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.InstructionsTitle,
                  style: TextStyles.bold18.copyWith(color: Colors.white),
                ),
                const SizedBox(height: AppSpacing.s4),
                Text(
                  l10n.InstructionsSubtitle,
                  style: TextStyles.regular14.copyWith(
                    color: Colors.white.withOpacity(0.85),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
