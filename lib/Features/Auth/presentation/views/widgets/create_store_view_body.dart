import 'package:flutter/material.dart';
import 'package:marchant_app/Features/Auth/presentation/views/widgets/custom_gradient_text.dart';
import 'package:marchant_app/Features/Auth/presentation/views/widgets/store_form.dart';
import 'package:marchant_app/core/utils/app_colors.dart';
import 'package:marchant_app/core/utils/app_text_style.dart';

class CreateStoreViewBody extends StatelessWidget {
  const CreateStoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('إنشاء متجر', style: TextStyles.bold24),
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
                      CustomGradientText(text: 'تفاصيل المتجر'),
                      const SizedBox(height: 5),
                      Text(
                        'قم بإدخال كل التفاصيل التاليه',
                        style: TextStyles.semiBold12,
                      ),
                      const SizedBox(height: 17),
                      StoreForm(),
                      const SizedBox(height: 17),
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
