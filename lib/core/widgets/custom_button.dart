import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.isLogout,
  });
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final bool? isLogout;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          boxShadow:
              backgroundColor != null
                  ? [
                    BoxShadow(
                      color: Color(
                        0xffD31313,
                      ).withOpacity(0.40).withValues(alpha: 0.40),
                      blurRadius: AppSpacing.s16,
                      offset: const Offset(0, 0),
                    ),
                  ]
                  : [],
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(AppSpacing.radius16),
          color: backgroundColor,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors:
                backgroundColor == null
                    ? [Color(0xff820005), Color(0xffAA1212)]
                    : [],
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Visibility(
                visible: isLogout != null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    Assets.assetsIconsLogout,
                    width: 25,
                    height: 25,
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor(context),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyles.bold22.copyWith(
                  color: textColor ?? AppColors.white(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
