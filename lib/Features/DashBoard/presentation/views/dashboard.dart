import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_state.dart';
import 'package:tax_payer/Features/DashBoard/presentation/views/widgets/custom_nav_bar.dart';
import 'package:tax_payer/Features/Home/presentation/views/home_view.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/instructions_view.dart';
import 'package:tax_payer/Features/NewFile/presentation/views/new_file_view.dart';
import 'package:tax_payer/Features/Profile/presentation/views/profile_view.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/sign_out_confirmation_dialog_widget.dart';
import 'package:tax_payer/generated/l10n.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key, this.initialPage = 0});

  final int initialPage;

  @override
  State<DashBoard> createState() => _HomeBaseState();
}

class _HomeBaseState extends State<DashBoard> {
  late final PageController _pageController;
  late final List<Widget> _screens;
  int _pageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.initialPage.clamp(0, 3).toInt();
    _pageController = PageController(initialPage: _pageIndex);
    _screens = [HomeView(), InstructionsView(), NewFileView(), ProfileView()];
  }

  @override
  void didUpdateWidget(covariant DashBoard oldWidget) {
    super.didUpdateWidget(oldWidget);
    final nextPage = widget.initialPage.clamp(0, 3).toInt();

    if (nextPage != _pageIndex) {
      _pageIndex = nextPage;
      if (_pageController.hasClients) {
        _pageController.jumpToPage(nextPage);
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          customToastBar(
            context: context,
            message: S.of(context).LogoutSuccess,
            backgroundColor: AppColors.customGreen(),
            icon: Icons.check,
            textColor: AppColors.white(),
          );
          Prefs.setBool(AppConstants.kIsLogedIn, false);
          Prefs.removeUser(AppConstants.kCurrentUser);
          context.go(RouteNames.login);
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            return;
          }
          if (_pageIndex != 0) {
            setPage(0);
          } else {
            showCupertinoModalPopup(
              context: context,
              builder:
                  (_) => SignOutConfirmationDialogWidget(
                    onConfirm: () {
                      context.read<LogoutCubit>().logout();
                    },
                  ),
            );
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
          body: PageView.builder(
            controller: _pageController,
            itemCount: _screens.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _screens[index];
            },
          ),
          bottomNavigationBar: CustomNavBar(
            pageIndex: _pageIndex,
            onTap: setPage,
          ),
        ),
      ),
    );
  }

  void setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
