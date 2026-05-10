import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/custom_gradient_text.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/forgot_password_form.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).ForgotPassword, style: TextStyles.bold24),
              const SizedBox(height: AppSpacing.spacing50),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white(),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff6C7278).withOpacity(0.34),
                      blurRadius: 25,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.spacing24),
                  child: Column(
                    children: [
                      CustomGradientText(text: S.of(context).ForgotPassword),
                      const SizedBox(height: AppSpacing.spacing50),
                      Text(
                        S.of(context).EnterUsernameAndPhone,
                        style: TextStyles.semiBold12,
                      ),
                      const SizedBox(height: AppSpacing.spacing17),
                      ForgotPasswordForm(),
                      const SizedBox(height: AppSpacing.spacing17),
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
