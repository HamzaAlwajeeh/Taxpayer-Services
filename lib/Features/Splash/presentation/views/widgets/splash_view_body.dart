import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Splash/presentation/views/widgets/splash_background_colors.dart';
import 'package:tax_payer/Features/Splash/presentation/views/widgets/splash_loading_indicator.dart';
import 'package:tax_payer/Features/Splash/presentation/views/widgets/splash_logo.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
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
    _navigationTimer = Timer(_splashDuration, _navigateToOnBoarding);
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  void _navigateToOnBoarding() {
    if (!mounted) {
      return;
    }
    if (Prefs.getBool(AppConstants.kSeenOnBoarding) == true) {
      if (Prefs.getBool(AppConstants.kIsLogedIn) == true) {
        context.go(RouteNames.dashboard);
      }
      context.go(RouteNames.login);
    }
    context.go(RouteNames.onBoarding1);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDarkMode(context);

    return GradientBackground(
      hasImage: true,
      backgroundColors: const SplashBackgroundColors(),
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
