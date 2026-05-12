import 'package:flutter/material.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'تذكرني',
          style: TextStyle(
            color: AppColors.textPrimaryColor(context),
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(width: 4),

        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            activeColor: AppColors.primaryColor(context),
            side: BorderSide(color: AppColors.borderColor(context)),
          ),
        ),
      ],
    );
  }
}
