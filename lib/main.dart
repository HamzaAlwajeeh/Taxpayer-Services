import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_payer/core/routers/app_routes.dart';
import 'package:tax_payer/core/services/notification_service.dart';
import 'package:tax_payer/core/services/service_locator.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await NotificationService.initialize();
  // await Prefs.init();
  runApp(const MyApp());
  // Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.dark();
    final almaraiTextTheme = GoogleFonts.almaraiTextTheme(
      baseTheme.textTheme,
    ).apply(
      bodyColor: AppColors.textPrimaryColor,
      displayColor: AppColors.textPrimaryColor,
    );

    return MaterialApp.router(
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: AppRoutes.router,
      title: 'Tax Payer',
      theme: baseTheme.copyWith(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        textTheme: almaraiTextTheme,
        primaryTextTheme: almaraiTextTheme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
