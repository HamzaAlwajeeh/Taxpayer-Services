import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/app_routes.dart';
import 'package:tax_payer/core/services/notification_service.dart';
import 'package:tax_payer/core/services/service_locator.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await NotificationService.initialize();
  await Prefs.init();
  AppSettings.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      return MaterialApp.router(
        locale: AppSettings.localeSignal.value,
        themeMode: AppSettings.themeModeSignal.value,

        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),

        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerConfig: AppRoutes.router,
        title: AppConstants.kAppName,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
