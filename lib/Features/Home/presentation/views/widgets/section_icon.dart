import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class SectionIcon extends StatelessWidget {
  const SectionIcon({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.customRed(context, true),
      ),
      child: Center(
        child: SvgPicture.asset(
          icon,
          width: 22,
          height: 22,
          colorFilter: ColorFilter.mode(
            AppColors.textRedColor(context),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
