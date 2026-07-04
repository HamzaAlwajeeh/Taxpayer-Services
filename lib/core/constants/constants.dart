import 'package:tax_payer/core/services/shared_pref_singleton.dart';

class AppConstants {
  static const String kIp = '172.16.1.80';
  static String get ip => Prefs.getString(kApiBaseUrl) ?? kIp;
  static String get kBaseUrl => 'https://tax-backend.novelsoft.com.co/api';
  static const String kAppName = 'مصلحة الضرائب';
  static const String kAppVersion = '1.0.0';
  static const String kSeenOnBoarding = 'seenOnBoarding';
  static const String kIsLogedIn = 'isLogedIn';
  static const String krememberMe = 'rememberMe';
  static const String kCurrentUser = 'currentUser';
  static const String kToken = 'token';
  static const String kCurrentFile = 'currentFile';
  static const String kApiBaseUrl = 'apiBaseUrl';
  static const String kNotificationsScheduled = 'notifications_scheduled';
  static const String kHasRequestPending = 'hasRequestPending';
  static const String kResetPasswordCode = 'resetPasswordCode';

  static const String kCurrentLanguageKey = 'selected_language';
  static const String kArabicLang = 'ar';
  static const String kEnglishLang = 'en';

  static const String kMessage = 'message';
  static const String kUserName = 'userName';
  static const String kCreatedAt = 'createdAt';
  static const String kUpdatedAt = 'updatedAt';
  static const String kLastMessage = 'lastMessage';
  static const String kUserId = 'userId';
  static const String kSenderType = 'senderType';
  static const String kSenderTypeUser = 'user';
  static const String kSenderTypeAdmin = 'admin';
  static const String kChatsCollection = 'chats';
  static const String kMessagesCollection = 'messages';

  static const String kCurrentThemeKey = 'selected_theme';
  static const String kDarkTheme = 'dark';
  static const String kLightTheme = 'light';
  static const String kSavedUsername = 'savedUsername';
  static const String kSavedPassword = 'savedPassword';
  static const String kResetPasswordUsername = 'resetPasswordUsername';

  // API Endpoints
  static const String kLogin = 'tax-payer-mobile-login';
  static const String kRegister = 'create-tax-payer-mobile';
  static const String kUpdateProfile = 'update-tax-payer-mobile';
  static const String kLogout = 'tax-payer-mobile-logout';
  static const String kgetUserProfile = 'get-tax-payer-mobile-profile';
  static const String kCreateNewFile = 'requests';
  static const String kResetPasswordRequest = 'request';
  static const String kVerifyResetPasswordCode = 'verify';
  static const String kResetPassword = 'reset';
  static const String kGetUserFiles = 'get-tax-payer-mobile-files';
  static const String kGetUserFileById = 'get-tax-payer-mobile-file_By_Id';
  static const String kHasRequest = 'exists-request';
}
