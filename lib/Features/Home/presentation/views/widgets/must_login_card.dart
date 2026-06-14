import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/user_avatar.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';

class MustLoginCard extends StatelessWidget {
  const MustLoginCard({
    super.key,
    required this.message,
    required this.actionLabel,
    required this.onPressed,
    required this.icon,
    this.subTitle,
  });

  final String message;
  final String? subTitle;
  final String actionLabel;
  final VoidCallback onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.s16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.s16,
                        vertical: AppSpacing.s24,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.itemsColor(context),
                        borderRadius: BorderRadius.circular(AppSpacing.radius20),
                        border: Border.all(color: AppColors.borderColor(context)),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor(context),
                            blurRadius: AppSpacing.s12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UserAvatar(image: null, width: 80, height: 80, iconSize: 40),
                          const SizedBox(height: AppSpacing.s10),
                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyles.bold24.copyWith(
                              color: AppColors.textRedColor(context),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.s8),
                          Text(
                            subTitle ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyles.semiBold14.copyWith(
                              color: AppColors.textPrimaryColor(context),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.s16),
                          CustomButton(title: actionLabel, onPressed: onPressed),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
