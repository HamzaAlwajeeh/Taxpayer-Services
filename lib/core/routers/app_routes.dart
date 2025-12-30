import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marchant_app/Features/Analysis/presentation/views/analysis_view.dart';
import 'package:marchant_app/Features/Auth/presentation/views/create_store_view.dart';
import 'package:marchant_app/Features/Auth/presentation/views/login_view.dart';
import 'package:marchant_app/Features/Auth/presentation/views/sign_up_view.dart';
import 'package:marchant_app/Features/Base/presentation/views/home_base.dart';
import 'package:marchant_app/Features/Home/presentation/views/home_view.dart';
import 'package:marchant_app/Features/Profile/presentation/views/profile_view.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: CreateStoreView.routeName,
    debugLogDiagnostics: true,

    errorBuilder:
        (context, state) =>
            const Scaffold(body: Center(child: Text('Page Not Found'))),

    routes: [
      // Auth Routes
      _buildRoute(
        path: LoginView.routeName,
        child: const LoginView(),
        transition: TransitionType.slideFromRight,
      ),
      _buildRoute(
        path: SignUpView.routeName,
        child: const SignUpView(),
        transition: TransitionType.slideFromLeft,
      ),
      _buildRoute(
        path: CreateStoreView.routeName,
        child: const CreateStoreView(),
        transition: TransitionType.slideFromLeft,
      ),

      // App Routes
      _buildRoute(
        path: HomeBase.routeName,
        child: const HomeBase(),
        transition: TransitionType.slideFromBottom,
      ),
      _buildRoute(
        path: HomeView.routeName,
        child: const HomeView(),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: ProfileView.routeName,
        child: const ProfileView(),
        transition: TransitionType.fade,
      ),
      _buildRoute(
        path: AnalysisView.routeName,
        child: const AnalysisView(),
        transition: TransitionType.fade,
      ),
      // GoRoute(
      //   path: EditContactView.routeName,
      //   pageBuilder: (context, state) {
      //     final contact = state.extra as ContactModel;
      //     return _buildTransitionPage(
      //       state,
      //       EditContactView(contact: contact),
      //       TransitionType.slideFromRight,
      //     );
      //   },
      // ),
    ],
  );

  // Route builder
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

  // Transition Page
  static CustomTransitionPage _buildTransitionPage(
    GoRouterState state,
    Widget child,
    TransitionType transitionType,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transitionType) {
          case TransitionType.fade:
            return FadeTransition(opacity: animation, child: child);
          case TransitionType.slideFromRight:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              ),
              child: child,
            );
          case TransitionType.slideFromLeft:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
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
