import 'package:flutter/material.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_images.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s8),
      child: Image.asset(
        isDark ? Assets.assetsIconsSplashDark : Assets.assetsIconsSplashImage,
        width: MediaQuery.sizeOf(context).width / 1.5,
        fit: BoxFit.contain,
      ),
    );
  }
}
