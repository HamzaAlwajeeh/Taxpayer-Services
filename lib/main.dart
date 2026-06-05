import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/app_routes.dart';
import 'package:tax_payer/core/services/bloc_providers.dart';
import 'package:tax_payer/core/services/notification_service.dart';
import 'package:tax_payer/core/services/service_locator.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/services/simple_bloc_obsever.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/firebase_options.dart';
import 'package:tax_payer/generated/l10n.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  await initApp();
  runApp(const MyApp());
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initFirebase();
  _initServiceLocator();
  _initTimezones();
  await _initPrefs();
  _initAppSettings();
  await _initNotifications();
  _initBlocObserver();
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void _initServiceLocator() {
  setUpServiceLocator();
}

void _initTimezones() {
  try {
    tz_data.initializeTimeZones();
    final location = tz.getLocation('Asia/Aden');
    tz.setLocalLocation(location);
  } catch (e) {
    debugPrint("Failed to initialize timezone: $e");
  }
}

Future<void> _initPrefs() async {
  await Prefs.init();
}

void _initAppSettings() {
  AppSettings.init();
}

Future<void> _initNotifications() async {
  try {
    await NotificationService.initialize();
  } catch (e) {
    debugPrint("Failed to initialize notification service: $e");
  }
}

void _initBlocObserver() {
  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      return BlocProviders.wrapWithProviders(
        child: MaterialApp.router(
          locale: AppSettings.localeSignal.value,
          themeMode: AppSettings.themeModeSignal.value,

          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Almarai',
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor(false),
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Almarai',
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor(true),
          ),

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
        ),
      );
    });
  }
}
