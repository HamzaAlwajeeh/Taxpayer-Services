import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Analysis/presentation/views/analysis_view.dart';
import 'package:tax_payer/Features/Home/presentation/views/home_view.dart';
import 'package:tax_payer/Features/Profile/presentation/views/profile_view.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({super.key});
  static const String routeName = '/homeBase';

  @override
  State<HomeBase> createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {
  int pageIndex = 0;
  late final pages = const [HomeView(), AnalysisView(), ProfileView()];
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

  //   SafeArea buildCustomNavBar(BuildContext context) {
  //   return SafeArea(
  //     top: false,
  //     child: Container(
  //       padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
  //       decoration: BoxDecoration(
  //         color: ColorResources.itemsBackground(context),
  //         border: Border(
  //           top: BorderSide(color: ColorResources.inputBorder(context)),
  //         ),
  //       ),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: CustomNavBarItem(
  //               icon: Assets.assetsIconsHome,
  //               label: getTranslated('home', context),
  //               index: 0,
  //               pageIndex: _pageIndex,
  //               onTap: () => setPage(0),
  //             ),
  //           ),
  //           Expanded(
  //             child: CustomNavBarItem(
  //               icon: Assets.assetsIconsOrders,
  //               label: getTranslated('my_order', context),
  //               index: 1,
  //               pageIndex: _pageIndex,
  //               onTap: () => setPage(1),
  //             ),
  //           ),
  //           Expanded(
  //             child: CustomNavBarItem(
  //               icon: Assets.assetsIconsRefunds,
  //               label: getTranslated('refund', context),
  //               index: 2,
  //               pageIndex: _pageIndex,
  //               onTap: () => setPage(2),
  //             ),
  //           ),
  //           Expanded(
  //             child: CustomNavBarItem(
  //               icon: Assets.assetsIconsProfile,
  //               label: getTranslated('profile', context),
  //               index: 3,
  //               pageIndex: _pageIndex,
  //               onTap: () => setPage(3),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // void setPage(int pageIndex) {
  //   setState(() {
  //     _pageController.jumpToPage(pageIndex);
  //     _pageIndex = pageIndex;
  //   });
  // }
}
