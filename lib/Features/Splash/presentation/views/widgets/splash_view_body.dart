import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Splash/presentation/views/widgets/splash_loading_indicator.dart';
import 'package:tax_payer/Features/Splash/presentation/views/widgets/splash_logo.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  static const Duration _splashDuration = Duration(seconds: 4);
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    // _navigationTimer = Timer(_splashDuration, _navigateToDashboard);
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  void _navigateToDashboard() {
    if (!mounted) {
      return;
    }
    context.go(RouteNames.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDarkMode(context);

    return GradientBackground(
      child: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              const Spacer(flex: 7),
              SplashLogo(isDark: isDark),
              const Spacer(flex: 4),
              const SplashLoadingIndicator(),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
