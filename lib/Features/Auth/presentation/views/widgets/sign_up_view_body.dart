import 'package:flutter/material.dart';
import 'package:marchant_app/Features/Auth/presentation/views/widgets/custom_gradient_text.dart';
import 'package:marchant_app/Features/Auth/presentation/views/widgets/has_an_account.dart';
import 'package:marchant_app/Features/Auth/presentation/views/widgets/sign_up_form.dart';
import 'package:marchant_app/core/utils/app_colors.dart';
import 'package:marchant_app/core/utils/app_text_style.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('جديد', style: TextStyles.bold24),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
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
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      CustomGradientText(text: 'إنشاء حساب'),
                      const SizedBox(height: 5),
                      Text(
                        'قم بإنشاء حساب لإدارة منتجاتك',
                        style: TextStyles.semiBold12,
                      ),
                      const SizedBox(height: 17),
                      SignUpForm(),
                      const SizedBox(height: 17),
                      HasAnAccount(
                        primaryText: 'لديك حساب بالفعل ؟ ',
                        secondaryText: 'تسجيل الدخول',
                      ),
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
