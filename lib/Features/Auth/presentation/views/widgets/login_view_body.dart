import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/custom_gradient_text.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/login_form.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحباً بعودتك!', style: TextStyles.bold24),
              const SizedBox(height: 50),
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
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      CustomGradientText(text: 'تسجيل الدخول'),
                      const SizedBox(height: 5),
                      Text(
                        'سجّل الدخول لإدارة منتجاتك',
                        style: TextStyles.semiBold12,
                      ),
                      const SizedBox(height: 17),
                      LoginForm(),
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
