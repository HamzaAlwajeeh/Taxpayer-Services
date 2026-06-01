import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class HeroIconContainer extends StatelessWidget {
  const HeroIconContainer({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.textRedColor(context);

    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: primary.withOpacity(.10),
      ),
      child: Center(
        child: SvgPicture.asset(
          icon,
          width: 26,
          height: 26,
          colorFilter: ColorFilter.mode(primary, BlendMode.srcIn),
        ),
      ),
    );
  }
}
