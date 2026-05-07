import 'package:flutter/material.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(
                0xffD31313,
              ).withOpacity(0.40).withValues(alpha: 0.40),
              blurRadius: AppSpacing.s16,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(AppSpacing.radius16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [Color(0xff820005), Color(0xffAA1212)],
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.bold22.copyWith(color: AppColors.white()),
          ),
        ),
      ),
    );
  }
}
