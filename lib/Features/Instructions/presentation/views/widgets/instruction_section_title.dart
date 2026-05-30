import 'package:flutter/material.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class InstructionSectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const InstructionSectionTitle({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.customRed(context),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.textRedColor(context), size: 18),
        ),
        const SizedBox(width: AppSpacing.s10),
        Text(
          title,
          style: TextStyles.bold18.copyWith(
            color: AppColors.textBoldColor(context),
          ),
        ),
      ],
    );
  }
}
