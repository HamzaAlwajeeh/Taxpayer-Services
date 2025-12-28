import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:marchant_app/Features/Analysis/presentation/views/analysis_view.dart';
import 'package:marchant_app/Features/Home/presentation/views/home_view.dart';
import 'package:marchant_app/Features/Profile/presentation/views/profile_view.dart';
import 'package:marchant_app/core/utils/app_colors.dart';
import 'package:marchant_app/core/utils/app_text_style.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({super.key});
  static const String routeName = '/homeBase';

  @override
  State<HomeBase> createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {
  int pageIndex = 0;
  final pages = const [HomeView(), AnalysisView(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            height: 65,
            backgroundColor: Colors.transparent,
            color: AppColors.primaryColor,
            buttonBackgroundColor: AppColors.primaryColor,
            animationCurve: Curves.easeOutCubic,
            animationDuration: const Duration(milliseconds: 300),
            items: const [
              Icon(Icons.home, size: 33, color: AppColors.textPrimaryColor),
              Icon(
                Icons.analytics,
                size: 33,
                color: AppColors.textPrimaryColor,
              ),
              Icon(Icons.person, size: 33, color: AppColors.textPrimaryColor),
            ],
            onTap: (index) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
          appBar: AppBar(
            title: const Text('الصفحة الرئيسية', style: TextStyles.bold20),
          ),
          body: pages[pageIndex],
        ),
      ),
    );
  }
}
