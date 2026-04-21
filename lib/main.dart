import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tax_payer/core/routers/app_routes.dart';
import 'package:tax_payer/core/services/service_locator.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  // await Prefs.init();
  runApp(const MyApp());
  // Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        textTheme: ThemeData.light().textTheme
            .apply(fontFamily: 'NotoSansArabic')
            .copyWith(
              bodyLarge: const TextStyle(color: AppColors.textPrimaryColor),
              bodyMedium: const TextStyle(color: AppColors.textPrimaryColor),
              bodySmall: const TextStyle(color: AppColors.textPrimaryColor),
            ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
