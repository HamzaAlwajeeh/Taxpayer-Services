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

  /// `Logout Successfully`
  String get LogoutSuccess {
    return Intl.message(
      'Logout Successfully',
      name: 'LogoutSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get Loading {
    return Intl.message('Loading...', name: 'Loading', desc: '', args: []);
  }

  /// `First Name`
  String get FirstName {
    return Intl.message('First Name', name: 'FirstName', desc: '', args: []);
  }

  /// `Last Name`
  String get LastName {
    return Intl.message('Last Name', name: 'LastName', desc: '', args: []);
  }

  /// `UserName`
  String get UserName {
    return Intl.message('UserName', name: 'UserName', desc: '', args: []);
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `IdCard`
  String get IdCard {
    return Intl.message('IdCard', name: 'IdCard', desc: '', args: []);
  }

  /// `Profile image`
  String get ProfileImage {
    return Intl.message(
      'Profile image',
      name: 'ProfileImage',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `SignUp`
  String get SignUp {
    return Intl.message('SignUp', name: 'SignUp', desc: '', args: []);
  }

  /// `Image is required`
  String get ImageIsRequired {
    return Intl.message(
      'Image is required',
      name: 'ImageIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get FieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'FieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get PasswordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'PasswordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match`
  String get PasswordNotMatch {
    return Intl.message(
      'Password does not match',
      name: 'PasswordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Image source`
  String get ImageSourceTitle {
    return Intl.message(
      'Image source',
      name: 'ImageSourceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose how you want to add the image`
  String get ImageSourceSubTitle {
    return Intl.message(
      'Choose how you want to add the image',
      name: 'ImageSourceSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get Camera {
    return Intl.message('Camera', name: 'Camera', desc: '', args: []);
  }

  /// `Take a new photo`
  String get CameraSubTitle {
    return Intl.message(
      'Take a new photo',
      name: 'CameraSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload file`
  String get UploadFile {
    return Intl.message('Upload file', name: 'UploadFile', desc: '', args: []);
  }

  /// `Select JPEG, JPG, or PNG`
  String get UploadFileSubTitle {
    return Intl.message(
      'Select JPEG, JPG, or PNG',
      name: 'UploadFileSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
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

  /// `Forgot Password`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter username and phone number to verify your identity`
  String get EnterUsernameAndPhone {
    return Intl.message(
      'Enter username and phone number to verify your identity',
      name: 'EnterUsernameAndPhone',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get VerifyCodeTitle {
    return Intl.message(
      'Verify Code',
      name: 'VerifyCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to your phone to verify your identity`
  String get EnterVerificationCodeDesc {
    return Intl.message(
      'Enter the code sent to your phone to verify your identity',
      name: 'EnterVerificationCodeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get ResetPasswordTitle {
    return Intl.message(
      'Reset Password',
      name: 'ResetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password and confirm it`
  String get EnterNewPasswordDesc {
    return Intl.message(
      'Enter your new password and confirm it',
      name: 'EnterNewPasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `Code sent successfully`
  String get CodeSentSuccessfully {
    return Intl.message(
      'Code sent successfully',
      name: 'CodeSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Code verified successfully`
  String get CodeVerifiedSuccessfully {
    return Intl.message(
      'Code verified successfully',
      name: 'CodeVerifiedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get PasswordChangedSuccessfully {
    return Intl.message(
      'Password changed successfully',
      name: 'PasswordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message('Next', name: 'Next', desc: '', args: []);
  }

  /// `Resend Code`
  String get ResendCode {
    return Intl.message('Resend Code', name: 'ResendCode', desc: '', args: []);
  }

  /// `Verification Code`
  String get VerificationCode {
    return Intl.message(
      'Verification Code',
      name: 'VerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification Code`
  String get EnterVerificationCode {
    return Intl.message(
      'Enter Verification Code',
      name: 'EnterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get ResetPassword {
    return Intl.message(
      'Reset Password',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Al-Safaa Supermarket`
  String get StoreName {
    return Intl.message(
      'Al-Safaa Supermarket',
      name: 'StoreName',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get ActiveStatus {
    return Intl.message('Active', name: 'ActiveStatus', desc: '', args: []);
  }

  /// `Dark Mode`
  String get DarkMode {
    return Intl.message('Dark Mode', name: 'DarkMode', desc: '', args: []);
  }

  /// `Disabled`
  String get Disabled {
    return Intl.message('Disabled', name: 'Disabled', desc: '', args: []);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message('Arabic', name: 'Arabic', desc: '', args: []);
  }

  /// `Security and Privacy`
  String get SecurityAndPrivacy {
    return Intl.message(
      'Security and Privacy',
      name: 'SecurityAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Click to view details`
  String get ClickToViewDetails {
    return Intl.message(
      'Click to view details',
      name: 'ClickToViewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get BasicInfo {
    return Intl.message(
      'Basic Information',
      name: 'BasicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get EditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'EditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get Guest {
    return Intl.message('Guest', name: 'Guest', desc: '', args: []);
  }

  /// `App Version`
  String get AppVersion {
    return Intl.message('App Version', name: 'AppVersion', desc: '', args: []);
  }

  /// `Enabled`
  String get Enabled {
    return Intl.message('Enabled', name: 'Enabled', desc: '', args: []);
  }

  /// `Active`
  String get Active {
    return Intl.message('Active', name: 'Active', desc: '', args: []);
  }

  /// `English`
  String get English {
    return Intl.message('English', name: 'English', desc: '', args: []);
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
