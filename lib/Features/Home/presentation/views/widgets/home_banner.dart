import 'package:flutter/material.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 122),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s20,
        vertical: AppSpacing.s20,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor(context),
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor(context).withValues(alpha: 0.18),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            start: -18,
            bottom: -28,
            child: Icon(
              Icons.account_balance,
              size: 118,
              color: AppColors.white().withValues(alpha: 0.14),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الصفحة الرئيسية',
                textAlign: TextAlign.right,
                style: TextStyles.bold24.copyWith(color: AppColors.white()),
              ),
              const SizedBox(height: AppSpacing.s8),
              Text(
                'مرحباً بك في بوابتك الضريبية. هنا يمكنك متابعة حالة ملفك وآخر عمليات السداد',
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.white(),
                  height: 1.55,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
