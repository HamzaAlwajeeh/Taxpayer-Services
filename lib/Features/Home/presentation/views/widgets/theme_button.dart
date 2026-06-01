import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.itemsColor(context),
      shape: const CircleBorder(),
      elevation: 8,
      shadowColor: AppColors.shadowColor(context),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: 52,
          height: 52,
          child: Center(
            child: SvgPicture.asset(
              Assets.assetsIconsMoon,
              width: 26,
              height: 26,
              colorFilter: ColorFilter.mode(
                AppColors.textRedColor(context),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
