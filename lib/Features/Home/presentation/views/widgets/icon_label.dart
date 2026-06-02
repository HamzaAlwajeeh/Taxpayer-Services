import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class IconLabel extends StatelessWidget {
  const IconLabel({
    super.key,
    required this.icon,
    required this.label,
    required this.isTitle,
  });

  final String icon;
  final String label;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.textRedColor(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: primary.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(AppSpacing.radius12),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(primary, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.s8),
        Text(
          label,
          textAlign: TextAlign.right,
          style: (isTitle ? TextStyles.bold20 : TextStyles.bold18).copyWith(
            color: AppColors.textRedColor(context),
          ),
        ),
      ],
    );
  }
}
