import 'package:flutter/material.dart';
import 'package:tax_payer/Features/OnBoarding/data/models/on_boarding_model.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.page});

  final OnBoardingModel page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
      child: RepaintBoundary(child: Center(child: Image.asset(page.image))),
    );
  }
}
