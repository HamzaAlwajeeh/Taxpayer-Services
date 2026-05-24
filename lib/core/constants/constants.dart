class AppConstants {
  static const String kAppName = 'Tax Payer Services';
  static const String kAppVersion = '1.0.0';
  static const String kIp = '192.168.8.89:8000';
  static const String kSeenOnBoarding = 'seenOnBoarding';
  static const String kIsLogedIn = 'isLogedIn';
  static const String krememberMe = 'rememberMe';
  static const String kCurrentUser = 'currentUser';
  static const String kToken = 'token';

  static const String kCurrentLanguageKey = 'selected_language';
  static const String kArabicLang = 'ar';
  static const String kEnglishLang = 'en';

  static const String kCurrentThemeKey = 'selected_theme';
  static const String kDarkTheme = 'dark';
  static const String kLightTheme = 'light';
  static const String kSavedUsername = 'savedUsername';
  static const String kSavedPassword = 'savedPassword';

  // API Endpoints
  static const String kBaseUrl = 'http://$kIp/api';
  static const String kLogin = 'tax-payer-mobile-login';
  static const String kRegister = 'create-tax-payer-mobile';
  static const String kUpdateProfile = 'update-tax-payer-mobile';
  static const String kForgotPassword = 'forgot-password';
  static const String kVerifyCode = 'verify-code';
  static const String kResetPassword = 'reset-password';
  static const String kChangePassword = 'change-password';
  static const String kLogout = 'tax-payer-mobile-logout';
  static const String kgetUserProfile = 'get-tax-payer-mobile-profile';
  static const String kCreateNewFile = 'create-tax-payer-file';
}
