import 'package:flutter/material.dart';
import 'package:tax_payer/Features/OnBoarding/data/models/on_boarding_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.page});

  final OnBoardingModel page;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(child: Center(child: Image.asset(page.image)));
  }
}
