import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/OnBoarding/data/models/on_boarding_model.dart';
import 'package:tax_payer/Features/OnBoarding/presentation/views/widgets/on_boarding_background_colors.dart';
import 'package:tax_payer/Features/OnBoarding/presentation/views/widgets/on_boarding_navigation_bar.dart';
import 'package:tax_payer/Features/OnBoarding/presentation/views/widgets/on_boarding_page.dart';
import 'package:tax_payer/Features/OnBoarding/presentation/views/widgets/on_boarding_page_indicator.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';
import 'package:tax_payer/generated/l10n.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController pageController = PageController();

  int currentPage = 0;
  Locale? currentLocale;
  List<OnBoardingModel> pages = [];
  List<Widget> pageViews = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);

    if (currentLocale == locale && pages.isNotEmpty) {
      return;
    }

    currentLocale = locale;
    pages = [
      OnBoardingModel(
        image: Assets.assetsIconsOnBoarding1,
        leftArrow: Assets.assetsIconsOnBoarding1LeftArrow,
        rightArrow: Assets.assetsIconsOnBoarding1RightArrow,
        title: S.of(context).OnBoarding1Title,
        subTitle: S.of(context).OnBoarding1SubTitle,
        leftTopPosition: -50,
        rightTopPosition: 250,
      ),
      OnBoardingModel(
        image: Assets.assetsIconsOnBoarding2,
        leftArrow: Assets.assetsIconsOnBoarding2LeftArrow,
        rightArrow: Assets.assetsIconsOnBoarding2RightArrow,
        title: S.of(context).OnBoarding2Title,
        subTitle: S.of(context).OnBoarding2SubTitle,
        leftTopPosition: 250,
        rightTopPosition: -50,
      ),
      OnBoardingModel(
        image: Assets.assetsIconsOnBoarding3,
        leftArrow: Assets.assetsIconsOnBoarding3LeftArrow,
        rightArrow: Assets.assetsIconsOnBoarding3RightArrow,
        title: S.of(context).OnBoarding3Title,
        subTitle: S.of(context).OnBoarding3SubTitle,
        leftTopPosition: -50,
        rightTopPosition: 250,
      ),
    ];
    pageViews = pages
        .map((page) => OnBoardingPage(page: page))
        .toList(growable: false);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (currentPage == pages.length - 1) {
      context.go(RouteNames.login);
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      hasImage: true,
      backgroundColors: const OnBoarrdingBackgroundColors(),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: PageView(
                clipBehavior: Clip.none,
                controller: pageController,
                allowImplicitScrolling: true,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: pageViews,
              ),
            ),
            OnBoardingPageIndicator(
              currentPage: currentPage,
              pageCount: pages.length,
            ),
            const SizedBox(height: AppSpacing.s16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                child: Column(
                  key: ValueKey(currentPage),
                  children: [
                    Text(
                      pages[currentPage].title,
                      textAlign: TextAlign.center,
                      style: TextStyles.bold24.copyWith(
                        color: AppColors.textBoldColor(context),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s16),
                    Text(
                      pages[currentPage].subTitle,
                      textAlign: TextAlign.center,
                      style: TextStyles.semiBold16.copyWith(
                        height: 1.35,
                        color: AppColors.textSecondaryColor(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            OnBoardingNavigationBar(
              page: pages[currentPage],
              currentPage: currentPage,
              pageCount: pages.length,
              onNext: goToNextPage,
              onSkip: () => context.go(RouteNames.login),
            ),
          ],
        ),
      ),
    );
  }
}
