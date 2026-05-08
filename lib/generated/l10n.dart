// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Profile`
  String get Profile {
    return Intl.message('Profile', name: 'Profile', desc: '', args: []);
  }

  /// `Instructions`
  String get Instructions {
    return Intl.message(
      'Instructions',
      name: 'Instructions',
      desc: '',
      args: [],
    );
  }

  /// `NewFile`
  String get NewFile {
    return Intl.message('NewFile', name: 'NewFile', desc: '', args: []);
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Logout`
  String get Logout {
    return Intl.message('Logout', name: 'Logout', desc: '', args: []);
  }

  // skipped getter for the 'Sign Up' key

  /// `Loading...`
  String get Loading {
    return Intl.message('Loading...', name: 'Loading', desc: '', args: []);
  }

  /// `Your connection is closer wherever you go`
  String get OnBoarding1Title {
    return Intl.message(
      'Your connection is closer wherever you go',
      name: 'OnBoarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `Complete your transactions easily and clearly, track your income details, and manage your services from one place`
  String get OnBoarding1SubTitle {
    return Intl.message(
      'Complete your transactions easily and clearly, track your income details, and manage your services from one place',
      name: 'OnBoarding1SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Manage Your Services`
  String get OnBoarding2Title {
    return Intl.message(
      'Manage Your Services',
      name: 'OnBoarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `Control your services and manage your line with ease, track your line details and manage your services from one place`
  String get OnBoarding2SubTitle {
    return Intl.message(
      'Control your services and manage your line with ease, track your line details and manage your services from one place',
      name: 'OnBoarding2SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Your Friends`
  String get OnBoarding3Title {
    return Intl.message(
      'Connect with Your Friends',
      name: 'OnBoarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `Communicate with your friends and share your experiences, track your line details and manage your services from one place`
  String get OnBoarding3SubTitle {
    return Intl.message(
      'Communicate with your friends and share your experiences, track your line details and manage your services from one place',
      name: 'OnBoarding3SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
  }

  /// `Start Now`
  String get StartNow {
    return Intl.message('Start Now', name: 'StartNow', desc: '', args: []);
  }

  /// `Login Successully`
  String get LoginSuccess {
    return Intl.message(
      'Login Successully',
      name: 'LoginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout with ApiServer`
  String get ConnectionTimeout {
    return Intl.message(
      'Connection timeout with ApiServer',
      name: 'ConnectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout with ApiServer`
  String get SendTimeout {
    return Intl.message(
      'Send timeout with ApiServer',
      name: 'SendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout with ApiServer`
  String get ReceiveTimeout {
    return Intl.message(
      'Receive timeout with ApiServer',
      name: 'ReceiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Bad certificate`
  String get BadCertificate {
    return Intl.message(
      'Bad certificate',
      name: 'BadCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Request to ApiServer was canceled`
  String get RequestCanceled {
    return Intl.message(
      'Request to ApiServer was canceled',
      name: 'RequestCanceled',
      desc: '',
      args: [],
    );
  }

  /// `No Internet connection`
  String get NoInternetConnection {
    return Intl.message(
      'No Internet connection',
      name: 'NoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error, something went wrong, please try again later`
  String get UnknownError {
    return Intl.message(
      'Unknown error, something went wrong, please try again later',
      name: 'UnknownError',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized request`
  String get UnauthorizedRequest {
    return Intl.message(
      'Unauthorized request',
      name: 'UnauthorizedRequest',
      desc: '',
      args: [],
    );
  }

  /// `Method Not Found, please try again`
  String get MethodNotFound {
    return Intl.message(
      'Method Not Found, please try again',
      name: 'MethodNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Internal Server Error, please try again later`
  String get InternalServerError {
    return Intl.message(
      'Internal Server Error, please try again later',
      name: 'InternalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Oops, there is an error, please try again later`
  String get OopsError {
    return Intl.message(
      'Oops, there is an error, please try again later',
      name: 'OopsError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
