import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/login_cubit/login_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/register_cubit/register_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/verify_code_cubit/verify_code_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/views/create_store_view.dart';
import 'package:tax_payer/Features/Auth/presentation/views/forgot_password_view.dart';
import 'package:tax_payer/Features/Auth/presentation/views/login_view.dart';
import 'package:tax_payer/Features/Auth/presentation/views/reset_password_view.dart';
import 'package:tax_payer/Features/Auth/presentation/views/sign_up_view.dart';
import 'package:tax_payer/Features/Auth/presentation/views/verify_code_view.dart';
import 'package:tax_payer/Features/DashBoard/presentation/views/dashboard.dart';
import 'package:tax_payer/Features/Home/presentation/views/home_view.dart';
import 'package:tax_payer/Features/Instructions/data/models/instruction_detail_model.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/charitable_company_file_instruction_view.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/company_file_instruction_view.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/individual_file_instruction_view.dart';
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
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/service_locator.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/generated/l10n.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: true,
    errorBuilder:
        (context, state) =>
            const Scaffold(body: Center(child: Text('Page Not Found'))),
    routes: [
      _buildRoute(
        path: RouteNames.splash,
        child: const SplashView(),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: RouteNames.onBoarding1,
        child: const OnBoardingView(),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: RouteNames.login,
        child: BlocProvider(
          create: (context) => LoginCubit(getIt<AuthRepo>()),
          child: const LoginView(),
        ),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.register,
        child: BlocProvider(
          create: (context) => RegisterCubit(getIt<AuthRepo>()),
          child: const SignUpView(),
        ),
        transition: TransitionType.slideFromLeft,
      ),
      _buildRoute(
        path: CreateStoreView.routeName,
        child: const CreateStoreView(),
        transition: TransitionType.slideFromLeft,
      ),
      _buildRoute(
        path: RouteNames.forgotPassword,
        child: BlocProvider(
          create: (context) => ForgotPasswordCubit(getIt<AuthRepo>()),
          child: const ForgotPasswordView(),
        ),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.verifyCode,
        child: BlocProvider(
          create: (context) => VerifyCodeCubit(getIt<AuthRepo>()),
          child: const VerifyCodeView(),
        ),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.resetPassword,
        child: BlocProvider(
          create: (context) => ResetPasswordCubit(getIt<AuthRepo>()),
          child: const ResetPasswordView(),
        ),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.dashboard,
        child: BlocProvider(
          create: (context) => LogoutCubit(getIt<AuthRepo>()),
          child: const DashBoard(),
        ),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: RouteNames.home,
        child: const HomeView(),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: RouteNames.instructions,
        child: const InstructionsView(),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: RouteNames.individualFileInstruction,
        child: const IndividualFileInstructionView(),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.companyFileInstruction,
        child: const CompanyFileInstructionView(),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.charitableCompanyFileInstruction,
        child: const CharitableCompanyFileInstructionView(),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.taxDeclaration,
        child: const _TaxDeclarationBuilder(),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.taxPayment,
        child: const _TaxPaymentBuilder(),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.taxExemptions,
        child: const _TaxExemptionsBuilder(),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.penalties,
        child: const _PenaltiesBuilder(),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: RouteNames.newFile,
        child: const NewFileView(),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: RouteNames.profile,
        child: const ProfileView(),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: RouteNames.editProfile,
        child: BlocProvider(
          create: (context) => EditProfileCubit(getIt<ProfileRepo>()),
          child: const EditProfileView(),
        ),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: RouteNames.safetyAndPrivacy,
        child: const PrivacyAndSecurityView(),
        transition: TransitionType.fade,
      ),
    ],
  );

  static GoRoute _buildRoute({
    required String path,
    required Widget child,
    required TransitionType transition,
  }) {
    return GoRoute(
      path: path,
      pageBuilder:
          (context, state) => _buildTransitionPage(state, child, transition),
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

class _TaxDeclarationBuilder extends StatelessWidget {
  const _TaxDeclarationBuilder();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return InstructionDetailView(
      model: InstructionDetailModel(
        title: l10n.TaxDeclaration,
        headerIcon: Icons.description_rounded,
        headerDescription: l10n.TaxDeclarationDesc,
        accentColor: AppColors.customGreen(),
        steps: [
          l10n.TaxDeclarationStep1,
          l10n.TaxDeclarationStep2,
          l10n.TaxDeclarationStep3,
          l10n.TaxDeclarationStep4,
          l10n.TaxDeclarationStep5,
        ],
      ),
    );
  }
}

class _TaxPaymentBuilder extends StatelessWidget {
  const _TaxPaymentBuilder();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return InstructionDetailView(
      model: InstructionDetailModel(
        title: l10n.TaxPayment,
        headerIcon: Icons.payment_rounded,
        headerDescription: l10n.TaxPaymentDesc,
        accentColor: AppColors.customBlue(),
        steps: [
          l10n.TaxPaymentStep1,
          l10n.TaxPaymentStep2,
          l10n.TaxPaymentStep3,
          l10n.TaxPaymentStep4,
        ],
      ),
    );
  }
}

class _TaxExemptionsBuilder extends StatelessWidget {
  const _TaxExemptionsBuilder();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return InstructionDetailView(
      model: InstructionDetailModel(
        title: l10n.TaxExemptions,
        headerIcon: Icons.verified_rounded,
        headerDescription: l10n.TaxExemptionsDesc,
        accentColor: AppColors.customOrange(),
        steps: [
          l10n.TaxExemptionsStep1,
          l10n.TaxExemptionsStep2,
          l10n.TaxExemptionsStep3,
          l10n.TaxExemptionsStep4,
        ],
      ),
    );
  }
}

class _PenaltiesBuilder extends StatelessWidget {
  const _PenaltiesBuilder();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return InstructionDetailView(
      model: InstructionDetailModel(
        title: l10n.Penalties,
        headerIcon: Icons.gavel_rounded,
        headerDescription: l10n.PenaltiesDesc,
        accentColor: AppColors.primaryColor(context),
        steps: [
          l10n.PenaltiesStep1,
          l10n.PenaltiesStep2,
          l10n.PenaltiesStep3,
          l10n.PenaltiesStep4,
        ],
      ),
    );
  }
}
