import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class SectionIcon extends StatelessWidget {
  const SectionIcon({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.textRedColor(context);

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
      ),
      child: Center(
        child: SvgPicture.asset(
          icon,
          width: 22,
          height: 22,
          colorFilter: ColorFilter.mode(primary, BlendMode.srcIn),
        ),
      ),
    );
  }
}
