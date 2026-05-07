class AppConstants {
  static const String kAppName = 'Tax Payer Services';
  static const String kSeenOnBoarding = 'seenOnBoarding';
  static const String kToken = 'token';
  static const String kIp = '172.16.1.85:8000';

  static const String kCurrentLanguageKey = 'selected_language';
  static const String kArabicLang = 'ar';
  static const String kEnglishLang = 'en';

  static const String kCurrentThemeKey = 'selected_theme';
  static const String kDarkTheme = 'dark';
  static const String kLightTheme = 'light';

  // API Endpoints
  static const String kBaseUrl = 'http://$kIp/api';
  static const String kLogin = 'tax-payer-mobile-login';
  static const String kRegister = 'create-tax-payer-mobile';
  static const String kForgetPassword = 'forget-password';
  static const String kConfirmForgetPassword = 'confirm-forget-password';
  static const String kChangePassword = 'change-password';
  static const String kLogout = 'tax-payer-mobile-logout';
}
