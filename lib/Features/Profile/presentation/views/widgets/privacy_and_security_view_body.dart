import 'package:flutter/material.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class PrivacyAndSecurityViewBody extends StatelessWidget {
  const PrivacyAndSecurityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).PrivacyAndSecurityIntroTitle,
              style: TextStyles.bold20.copyWith(
                color: AppColors.textBoldColor(context),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              S.of(context).PrivacyAndSecurityIntroBody,
              style: TextStyles.regular14.copyWith(
                color: AppColors.textSecondaryColor(context),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).PrivacyAndSecurityDataTitle,
              style: TextStyles.bold16.copyWith(
                color: AppColors.textBoldColor(context),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              S.of(context).PrivacyAndSecurityDataBody,
              style: TextStyles.regular14.copyWith(
                color: AppColors.textSecondaryColor(context),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).PrivacyAndSecurityCommitmentTitle,
              style: TextStyles.bold16.copyWith(
                color: AppColors.textBoldColor(context),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              S.of(context).PrivacyAndSecurityCommitmentBody,
              style: TextStyles.regular14.copyWith(
                color: AppColors.textSecondaryColor(context),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
