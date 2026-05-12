import 'package:flutter/material.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class PrivacyAndSecurityViewBody extends StatelessWidget {
  const PrivacyAndSecurityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Privacy And Security Body',
        style: TextStyle(color: AppColors.textRedColor(context)),
      ),
    );
  }
}
