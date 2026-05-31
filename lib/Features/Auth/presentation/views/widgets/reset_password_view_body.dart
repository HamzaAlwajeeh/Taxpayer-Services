import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/custom_gradient_text.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/reset_password_form.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/logo_widget.dart';
import 'package:tax_payer/generated/l10n.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.s20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),
              const SizedBox(height: 16),
              Text(
                S.of(context).ResetPasswordTitle,
                style: TextStyles.bold24.copyWith(
                  color: AppColors.textBoldColor(context),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.itemsColor(context),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.borderColor(context),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor(context),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 28,
                  ),
                  child: Column(
                    children: [
                      CustomGradientText(
                        text: S.of(context).ResetPasswordTitle,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        S.of(context).EnterNewPasswordDesc,
                        textAlign: TextAlign.center,
                        style: TextStyles.semiBold12.copyWith(
                          color: AppColors.textSecondaryColor(context),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ResetPasswordForm(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
