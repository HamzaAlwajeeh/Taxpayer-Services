import 'package:flutter/material.dart';
import 'package:tax_payer/Features/OnBoarding/data/models/on_boarding_model.dart';
import 'package:tax_payer/Features/OnBoarding/presentation/views/widgets/on_boarding_arrow_button.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/generated/l10n.dart';

class OnBoardingNavigationBar extends StatelessWidget {
  const OnBoardingNavigationBar({
    super.key,
    required this.page,
    required this.currentPage,
    required this.pageCount,
    required this.onNext,
    required this.onSkip,
  });

  final OnBoardingModel page;
  final int currentPage;
  final int pageCount;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentPage == pageCount - 1;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.s24,
        AppSpacing.s16,
        AppSpacing.s24,
        AppSpacing.s32,
      ),
      child: SizedBox(
        height: 56,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 200),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              alignment: Alignment.center,
              children: [
                ...previousChildren,
                if (currentChild != null) currentChild,
              ],
            );
          },
          transitionBuilder: (child, animation) {
            final scaleAnimation = Tween<double>(
              begin: 0.96,
              end: 1,
            ).animate(animation);

            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: scaleAnimation, child: child),
            );
          },
          child:
              isLastPage
                  ? CustomButton(
                    key: const ValueKey('start_now_button'),
                    title: S.of(context).StartNow,
                    onPressed: onNext,
                  )
                  : Row(
                    key: const ValueKey('on_boarding_navigation_actions'),
                    children: [
                      TextButton(
                        onPressed: onSkip,
                        child: Text(
                          S.of(context).Skip,
                          style: TextStyles.bold18.copyWith(
                            color: AppColors.textBoldColor(context),
                          ),
                        ),
                      ),
                      const Spacer(),
                      OnBoardingArrowButton(onPressed: onNext),
                    ],
                  ),
        ),
      ),
    );
  }
}
