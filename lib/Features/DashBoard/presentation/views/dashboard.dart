import 'package:flutter/material.dart';
import 'package:tax_payer/Features/DashBoard/presentation/views/widgets/custom_nav_bar.dart';
import 'package:tax_payer/Features/Home/presentation/views/home_view.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/instructions_view.dart';
import 'package:tax_payer/Features/NewFile/presentation/views/new_file_view.dart';
import 'package:tax_payer/Features/Profile/presentation/views/profile_view.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _HomeBaseState();
}

class _HomeBaseState extends State<DashBoard> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  late List<Widget> _screens;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();
    _screens = [HomeView(), InstructionsView(), NewFileView(), ProfileView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _screens.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: CustomNavBar(pageIndex: _pageIndex, onTap: setPage),
    );
  }

  void setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
