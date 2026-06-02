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
import 'package:tax_payer/generated/l10n.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUpServiceLocator();

  tz.initializeTimeZones();
  final location = tz.getLocation('Asia/Aden');
  tz.setLocalLocation(location);

  await Prefs.init();
  AppSettings.init();

  await NotificationService.initialize();

  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
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
