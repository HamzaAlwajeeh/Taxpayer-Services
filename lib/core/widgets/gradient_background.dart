import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/widgets/blur_circle.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.child,
    this.hasImage,
    this.backgroundColors,
  });
  final Widget child;
  final bool? hasImage;
  final Widget? backgroundColors;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundColors ??
            Positioned(
              top: -44,
              left: -233,
              child: BlurCircle(
                color: AppColors.primaryColor(context).withValues(alpha: 0.15),
                size: 350,
              ),
            ),
        Visibility(
          visible: hasImage ?? false,
          child: Positioned(
            bottom: 0,
            right: 0,
            top: -530,
            child: SvgPicture.asset(Assets.assetsImagesBackImage),
          ),
        ),
        child,
      ],
    );
  }
}
