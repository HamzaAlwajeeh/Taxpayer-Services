import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/login_cubit/login_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/register_cubit/register_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/verify_code_cubit/verify_code_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/views/forgot_password_view.dart';
import 'package:tax_payer/Features/Auth/presentation/views/login_view.dart';
import 'package:tax_payer/Features/Auth/presentation/views/reset_password_view.dart';
import 'package:tax_payer/Features/Auth/presentation/views/sign_up_view.dart';
import 'package:tax_payer/Features/Auth/presentation/views/verify_code_view.dart';
import 'package:tax_payer/Features/DashBoard/presentation/views/dashboard.dart';
import 'package:tax_payer/Features/Home/presentation/views/home_view.dart';
import 'package:tax_payer/Features/Instructions/data/models/instruction_detail_model.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/instruction_detail_view.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/instructions_view.dart';
import 'package:tax_payer/Features/NewFile/presentation/views/new_file_view.dart';
import 'package:tax_payer/Features/OnBoarding/presentation/views/on_boarding_view.dart';
import 'package:tax_payer/Features/Profile/data/repos/profile.repo.dart';
import 'package:tax_payer/Features/Profile/presentation/logic/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:tax_payer/Features/Profile/presentation/views/edit_profile_view.dart';
import 'package:tax_payer/Features/Profile/presentation/views/privacy_and_security_view.dart';
import 'package:tax_payer/Features/Profile/presentation/views/profile_view.dart';
import 'package:tax_payer/Features/Splash/presentation/views/splash_view.dart';
import 'package:tax_payer/Features/init_view.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/service_locator.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) {
      return const Scaffold(body: Center(child: Text('Page Not Found')));
    },
    routes: [
      _buildRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashView(),
        transition: TransitionType.fade,
      ),

      _buildRoute(
        path: RouteNames.onBoarding1,
        builder: (context, state) => const OnBoardingView(),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: RouteNames.initView,
        builder: (context, state) => const InitView(),
        transition: TransitionType.fade,
      ),

      _buildRoute(
        path: RouteNames.login,
        builder:
            (context, state) => BlocProvider(
              create: (context) => LoginCubit(getIt<AuthRepo>()),
              child: const LoginView(),
            ),
        transition: TransitionType.slideFromRight,
      ),

      _buildRoute(
        path: RouteNames.register,
        builder:
            (context, state) => BlocProvider(
              create: (context) => RegisterCubit(getIt<AuthRepo>()),
              child: const SignUpView(),
            ),
        transition: TransitionType.slideFromLeft,
      ),

      _buildRoute(
        path: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordView(),
        transition: TransitionType.slideFromRight,
      ),

      _buildRoute(
        path: RouteNames.verifyCode,
        builder:
            (context, state) => BlocProvider(
              create: (context) => VerifyCodeCubit(getIt<AuthRepo>()),
              child: const VerifyCodeView(),
            ),
        transition: TransitionType.slideFromRight,
      ),

      _buildRoute(
        path: RouteNames.resetPassword,
        builder:
            (context, state) => BlocProvider(
              create: (context) => ResetPasswordCubit(getIt<AuthRepo>()),
              child: const ResetPasswordView(),
            ),
        transition: TransitionType.slideFromRight,
      ),

      _buildRoute(
        path: RouteNames.dashboard,
        builder:
            (context, state) => BlocProvider(
              create: (context) => LogoutCubit(getIt<AuthRepo>()),
              child: const DashBoard(),
            ),
        transition: TransitionType.fade,
      ),

      _buildRoute(
        path: RouteNames.home,
        builder: (context, state) => const HomeView(),
        transition: TransitionType.fade,
      ),

      _buildRoute(
        path: RouteNames.instructions,
        builder: (context, state) => const InstructionsView(),
        transition: TransitionType.fade,
      ),

      _buildRoute(
        path: RouteNames.instructionsDetail,
        builder: (context, state) {
          final model = state.extra as InstructionDetailModel;

          return InstructionDetailView(model: model);
        },
        transition: TransitionType.slideFromRight,
      ),

      _buildRoute(
        path: RouteNames.newFile,
        builder: (context, state) => const NewFileView(),
        transition: TransitionType.fade,
      ),

      _buildRoute(
        path: RouteNames.profile,
        builder: (context, state) => const ProfileView(),
        transition: TransitionType.fade,
      ),

      _buildRoute(
        path: RouteNames.editProfile,
        builder:
            (context, state) => BlocProvider(
              create: (context) => EditProfileCubit(getIt<ProfileRepo>()),
              child: const EditProfileView(),
            ),
        transition: TransitionType.fade,
      ),

      _buildRoute(
        path: RouteNames.safetyAndPrivacy,
        builder: (context, state) => const PrivacyAndSecurityView(),
        transition: TransitionType.fade,
      ),
    ],
  );

  static GoRoute _buildRoute({
    required String path,
    required Widget Function(BuildContext, GoRouterState) builder,
    required TransitionType transition,
  }) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) {
        return _buildTransitionPage(state, builder(context, state), transition);
      },
    );
  }

  static Page _buildTransitionPage(
    GoRouterState state,
    Widget child,
    TransitionType transition,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transition) {
          case TransitionType.fade:
            return FadeTransition(opacity: animation, child: child);

          case TransitionType.slideFromRight:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut),
              ),
              child: child,
            );

          case TransitionType.slideFromLeft:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut),
              ),
              child: child,
            );

          case TransitionType.slideFromBottom:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut),
              ),
              child: child,
            );

          case TransitionType.scale:
            return ScaleTransition(scale: animation, child: child);
        }
      },
    );
  }
}

enum TransitionType {
  fade,
  slideFromRight,
  slideFromLeft,
  slideFromBottom,
  scale,
}
