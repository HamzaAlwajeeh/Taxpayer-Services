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
    this.isLogout = false,
  });

  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    final bool isOutlinedLogout = isLogout;

    return InkWell(
      borderRadius: BorderRadius.circular(AppSpacing.radius16),
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          boxShadow:
              !isOutlinedLogout
                  ? [
                    BoxShadow(
                      color: const Color(0xffD31313).withOpacity(0.40),
                      blurRadius: AppSpacing.s16,
                      offset: const Offset(0, 0),
                    ),
                  ]
                  : [],

          border: Border.all(
            color:
                isOutlinedLogout
                    ? borderColor ?? AppColors.primaryColor(context)
                    : Colors.transparent,
          ),

          borderRadius: BorderRadius.circular(AppSpacing.radius16),

          color:
              isOutlinedLogout ? backgroundColor ?? Colors.transparent : null,

          gradient:
              isOutlinedLogout
                  ? null
                  : const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff820005), Color(0xffAA1212)],
                  ),
        ),

        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isOutlinedLogout) ...[
                SvgPicture.asset(
                  Assets.assetsIconsLogout,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    textColor ?? AppColors.primaryColor(context),
                    BlendMode.srcIn,
                  ),
                ),

                const SizedBox(width: 10),
              ],

              Text(
                title,
                style: TextStyles.bold22.copyWith(
                  color:
                      textColor ??
                      (isOutlinedLogout
                          ? AppColors.primaryColor(context)
                          : AppColors.white()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
