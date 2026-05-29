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

  /// `Instructions & Guidelines`
  String get InstructionsTitle {
    return Intl.message(
      'Instructions & Guidelines',
      name: 'InstructionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Everything you need to know to get started with taxpayer services`
  String get InstructionsSubtitle {
    return Intl.message(
      'Everything you need to know to get started with taxpayer services',
      name: 'InstructionsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `File Opening Requirements`
  String get FileOpeningRequirements {
    return Intl.message(
      'File Opening Requirements',
      name: 'FileOpeningRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Select file type to view requirements`
  String get FileOpeningRequirementsDesc {
    return Intl.message(
      'Select file type to view requirements',
      name: 'FileOpeningRequirementsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Individual File`
  String get IndividualFile {
    return Intl.message(
      'Individual File',
      name: 'IndividualFile',
      desc: '',
      args: [],
    );
  }

  /// `Requirements for opening an individual tax file`
  String get IndividualFileDesc {
    return Intl.message(
      'Requirements for opening an individual tax file',
      name: 'IndividualFileDesc',
      desc: '',
      args: [],
    );
  }

  /// `Company File`
  String get CompanyFile {
    return Intl.message(
      'Company File',
      name: 'CompanyFile',
      desc: '',
      args: [],
    );
  }

  /// `Requirements for opening a company tax file`
  String get CompanyFileDesc {
    return Intl.message(
      'Requirements for opening a company tax file',
      name: 'CompanyFileDesc',
      desc: '',
      args: [],
    );
  }

  /// `Charitable Company`
  String get CharitableCompanyFile {
    return Intl.message(
      'Charitable Company',
      name: 'CharitableCompanyFile',
      desc: '',
      args: [],
    );
  }

  /// `Requirements for opening a charitable company file`
  String get CharitableCompanyFileDesc {
    return Intl.message(
      'Requirements for opening a charitable company file',
      name: 'CharitableCompanyFileDesc',
      desc: '',
      args: [],
    );
  }

  /// `General Instructions`
  String get GeneralInstructions {
    return Intl.message(
      'General Instructions',
      name: 'GeneralInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Tax Declaration`
  String get TaxDeclaration {
    return Intl.message(
      'Tax Declaration',
      name: 'TaxDeclaration',
      desc: '',
      args: [],
    );
  }

  /// `How to submit your tax declaration and deadlines`
  String get TaxDeclarationDesc {
    return Intl.message(
      'How to submit your tax declaration and deadlines',
      name: 'TaxDeclarationDesc',
      desc: '',
      args: [],
    );
  }

  /// `Tax Payment`
  String get TaxPayment {
    return Intl.message('Tax Payment', name: 'TaxPayment', desc: '', args: []);
  }

  /// `Methods and procedures for paying tax dues`
  String get TaxPaymentDesc {
    return Intl.message(
      'Methods and procedures for paying tax dues',
      name: 'TaxPaymentDesc',
      desc: '',
      args: [],
    );
  }

  /// `Tax Exemptions`
  String get TaxExemptions {
    return Intl.message(
      'Tax Exemptions',
      name: 'TaxExemptions',
      desc: '',
      args: [],
    );
  }

  /// `Cases eligible for tax exemption and conditions`
  String get TaxExemptionsDesc {
    return Intl.message(
      'Cases eligible for tax exemption and conditions',
      name: 'TaxExemptionsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Penalties & Sanctions`
  String get Penalties {
    return Intl.message(
      'Penalties & Sanctions',
      name: 'Penalties',
      desc: '',
      args: [],
    );
  }

  /// `Tax violations and associated penalties`
  String get PenaltiesDesc {
    return Intl.message(
      'Tax violations and associated penalties',
      name: 'PenaltiesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Required Documents`
  String get RequiredDocuments {
    return Intl.message(
      'Required Documents',
      name: 'RequiredDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Individual File Requirements`
  String get IndividualFileRequirements {
    return Intl.message(
      'Individual File Requirements',
      name: 'IndividualFileRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Company File Requirements`
  String get CompanyFileRequirements {
    return Intl.message(
      'Company File Requirements',
      name: 'CompanyFileRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Charitable Company File Requirements`
  String get CharitableCompanyFileRequirements {
    return Intl.message(
      'Charitable Company File Requirements',
      name: 'CharitableCompanyFileRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Trade Name`
  String get IndividualReq1 {
    return Intl.message(
      'Trade Name',
      name: 'IndividualReq1',
      desc: '',
      args: [],
    );
  }

  /// `Commercial Record`
  String get IndividualReq2 {
    return Intl.message(
      'Commercial Record',
      name: 'IndividualReq2',
      desc: '',
      args: [],
    );
  }

  /// `Activity License`
  String get IndividualReq3 {
    return Intl.message(
      'Activity License',
      name: 'IndividualReq3',
      desc: '',
      args: [],
    );
  }

  /// `Trade Picture`
  String get IndividualReq4 {
    return Intl.message(
      'Trade Picture',
      name: 'IndividualReq4',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Card`
  String get IndividualReq5 {
    return Intl.message(
      'Insurance Card',
      name: 'IndividualReq5',
      desc: '',
      args: [],
    );
  }

  /// `Property Document Picture`
  String get IndividualReq6 {
    return Intl.message(
      'Property Document Picture',
      name: 'IndividualReq6',
      desc: '',
      args: [],
    );
  }

  /// `Articles of Incorporation`
  String get CompanyReq1 {
    return Intl.message(
      'Articles of Incorporation',
      name: 'CompanyReq1',
      desc: '',
      args: [],
    );
  }

  /// `Government License`
  String get CompanyReq2 {
    return Intl.message(
      'Government License',
      name: 'CompanyReq2',
      desc: '',
      args: [],
    );
  }

  /// `Partners ID Cards`
  String get CompanyReq3 {
    return Intl.message(
      'Partners ID Cards',
      name: 'CompanyReq3',
      desc: '',
      args: [],
    );
  }

  /// `Copy of the bylaws`
  String get CharitableReq1 {
    return Intl.message(
      'Copy of the bylaws',
      name: 'CharitableReq1',
      desc: '',
      args: [],
    );
  }

  /// `Access the electronic declaration system`
  String get TaxDeclarationStep1 {
    return Intl.message(
      'Access the electronic declaration system',
      name: 'TaxDeclarationStep1',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the tax declaration form with financial data`
  String get TaxDeclarationStep2 {
    return Intl.message(
      'Fill in the tax declaration form with financial data',
      name: 'TaxDeclarationStep2',
      desc: '',
      args: [],
    );
  }

  /// `Attach financial statements and supporting documents`
  String get TaxDeclarationStep3 {
    return Intl.message(
      'Attach financial statements and supporting documents',
      name: 'TaxDeclarationStep3',
      desc: '',
      args: [],
    );
  }

  /// `Review data and verify accuracy`
  String get TaxDeclarationStep4 {
    return Intl.message(
      'Review data and verify accuracy',
      name: 'TaxDeclarationStep4',
      desc: '',
      args: [],
    );
  }

  /// `Submit declaration and receive reference number`
  String get TaxDeclarationStep5 {
    return Intl.message(
      'Submit declaration and receive reference number',
      name: 'TaxDeclarationStep5',
      desc: '',
      args: [],
    );
  }

  /// `Obtain payment notification from the system`
  String get TaxPaymentStep1 {
    return Intl.message(
      'Obtain payment notification from the system',
      name: 'TaxPaymentStep1',
      desc: '',
      args: [],
    );
  }

  /// `Choose payment method (bank / electronic)`
  String get TaxPaymentStep2 {
    return Intl.message(
      'Choose payment method (bank / electronic)',
      name: 'TaxPaymentStep2',
      desc: '',
      args: [],
    );
  }

  /// `Complete payment and save receipt`
  String get TaxPaymentStep3 {
    return Intl.message(
      'Complete payment and save receipt',
      name: 'TaxPaymentStep3',
      desc: '',
      args: [],
    );
  }

  /// `Verify tax file status update`
  String get TaxPaymentStep4 {
    return Intl.message(
      'Verify tax file status update',
      name: 'TaxPaymentStep4',
      desc: '',
      args: [],
    );
  }

  /// `Submit exemption request via electronic system`
  String get TaxExemptionsStep1 {
    return Intl.message(
      'Submit exemption request via electronic system',
      name: 'TaxExemptionsStep1',
      desc: '',
      args: [],
    );
  }

  /// `Attach documents proving exemption eligibility`
  String get TaxExemptionsStep2 {
    return Intl.message(
      'Attach documents proving exemption eligibility',
      name: 'TaxExemptionsStep2',
      desc: '',
      args: [],
    );
  }

  /// `Wait for review by competent authority`
  String get TaxExemptionsStep3 {
    return Intl.message(
      'Wait for review by competent authority',
      name: 'TaxExemptionsStep3',
      desc: '',
      args: [],
    );
  }

  /// `Receive approval or rejection with reasons`
  String get TaxExemptionsStep4 {
    return Intl.message(
      'Receive approval or rejection with reasons',
      name: 'TaxExemptionsStep4',
      desc: '',
      args: [],
    );
  }

  /// `Late tax declaration submission penalty`
  String get PenaltiesStep1 {
    return Intl.message(
      'Late tax declaration submission penalty',
      name: 'PenaltiesStep1',
      desc: '',
      args: [],
    );
  }

  /// `Late tax payment penalty`
  String get PenaltiesStep2 {
    return Intl.message(
      'Late tax payment penalty',
      name: 'PenaltiesStep2',
      desc: '',
      args: [],
    );
  }

  /// `Failure to maintain accounting books penalty`
  String get PenaltiesStep3 {
    return Intl.message(
      'Failure to maintain accounting books penalty',
      name: 'PenaltiesStep3',
      desc: '',
      args: [],
    );
  }

  /// `Submitting incorrect or misleading data penalty`
  String get PenaltiesStep4 {
    return Intl.message(
      'Submitting incorrect or misleading data penalty',
      name: 'PenaltiesStep4',
      desc: '',
      args: [],
    );
  }

  /// `Important Note`
  String get ImportantNote {
    return Intl.message(
      'Important Note',
      name: 'ImportantNote',
      desc: '',
      args: [],
    );
  }

  /// `All documents must be valid and certified by competent authorities. You can visit the nearest tax office for assistance.`
  String get IndividualNote {
    return Intl.message(
      'All documents must be valid and certified by competent authorities. You can visit the nearest tax office for assistance.',
      name: 'IndividualNote',
      desc: '',
      args: [],
    );
  }

  /// `Opening a company file requires personal attendance of the authorized manager or an official notarized authorization. All documents must be translated to Arabic if in a foreign language.`
  String get CompanyNote {
    return Intl.message(
      'Opening a company file requires personal attendance of the authorized manager or an official notarized authorization. All documents must be translated to Arabic if in a foreign language.',
      name: 'CompanyNote',
      desc: '',
      args: [],
    );
  }

  /// `Registered charitable organizations may be eligible for special tax exemptions. Please inquire about specific conditions.`
  String get CharitableNote {
    return Intl.message(
      'Registered charitable organizations may be eligible for special tax exemptions. Please inquire about specific conditions.',
      name: 'CharitableNote',
      desc: '',
      args: [],
    );
  }

  /// `Steps to Follow`
  String get StepsToFollow {
    return Intl.message(
      'Steps to Follow',
      name: 'StepsToFollow',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get ViewDetails {
    return Intl.message(
      'View Details',
      name: 'ViewDetails',
      desc: '',
      args: [],
    );
  }

  /// `File Type`
  String get FileType {
    return Intl.message('File Type', name: 'FileType', desc: '', args: []);
  }

  /// `Trade Name`
  String get TradeNameField {
    return Intl.message(
      'Trade Name',
      name: 'TradeNameField',
      desc: '',
      args: [],
    );
  }

  /// `Commercial Record`
  String get CommercialRecordField {
    return Intl.message(
      'Commercial Record',
      name: 'CommercialRecordField',
      desc: '',
      args: [],
    );
  }

  /// `Activity License`
  String get ActivityLicenseField {
    return Intl.message(
      'Activity License',
      name: 'ActivityLicenseField',
      desc: '',
      args: [],
    );
  }

  /// `Trade Picture`
  String get TradePictureField {
    return Intl.message(
      'Trade Picture',
      name: 'TradePictureField',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Card`
  String get InsuranceCardField {
    return Intl.message(
      'Insurance Card',
      name: 'InsuranceCardField',
      desc: '',
      args: [],
    );
  }

  /// `Property / Rental Doc`
  String get PropertyDocPictureField {
    return Intl.message(
      'Property / Rental Doc',
      name: 'PropertyDocPictureField',
      desc: '',
      args: [],
    );
  }

  /// `Articles of Incorporation (Optional)`
  String get ArticlesOfIncorporationField {
    return Intl.message(
      'Articles of Incorporation (Optional)',
      name: 'ArticlesOfIncorporationField',
      desc: '',
      args: [],
    );
  }

  /// `Government License (Optional)`
  String get GovernmentLicenseField {
    return Intl.message(
      'Government License (Optional)',
      name: 'GovernmentLicenseField',
      desc: '',
      args: [],
    );
  }

  /// `Partners ID Cards (Optional)`
  String get PartinersIDCardsField {
    return Intl.message(
      'Partners ID Cards (Optional)',
      name: 'PartinersIDCardsField',
      desc: '',
      args: [],
    );
  }

  /// `Bylaws Copy (Optional)`
  String get BylawsCopyField {
    return Intl.message(
      'Bylaws Copy (Optional)',
      name: 'BylawsCopyField',
      desc: '',
      args: [],
    );
  }

  /// `Submit Request`
  String get SubmitNewFileRequest {
    return Intl.message(
      'Submit Request',
      name: 'SubmitNewFileRequest',
      desc: '',
      args: [],
    );
  }

  /// `Please upload all required documents first!`
  String get UploadAllDocumentsError {
    return Intl.message(
      'Please upload all required documents first!',
      name: 'UploadAllDocumentsError',
      desc: '',
      args: [],
    );
  }

  /// `New File Details`
  String get NewFileDetailsTitle {
    return Intl.message(
      'New File Details',
      name: 'NewFileDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter details and attach documents to submit request`
  String get NewFileDetailsDesc {
    return Intl.message(
      'Enter details and attach documents to submit request',
      name: 'NewFileDetailsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Select your preferred language`
  String get SelectLanguageMessage {
    return Intl.message(
      'Select your preferred language',
      name: 'SelectLanguageMessage',
      desc: '',
      args: [],
    );
  }

  /// `Tax Office Location`
  String get TaxOfficeLocation {
    return Intl.message(
      'Tax Office Location',
      name: 'TaxOfficeLocation',
      desc: '',
      args: [],
    );
  }

  /// `Main Street - Addis - Opposite Al-Buraimi Car Showroom`
  String get TaxOfficeLocationDetails {
    return Intl.message(
      'Main Street - Addis - Opposite Al-Buraimi Car Showroom',
      name: 'TaxOfficeLocationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Hadhramout Tax Office`
  String get HadhramoutTaxOffice {
    return Intl.message(
      'Hadhramout Tax Office',
      name: 'HadhramoutTaxOffice',
      desc: '',
      args: [],
    );
  }

  /// `Maps`
  String get Maps {
    return Intl.message('Maps', name: 'Maps', desc: '', args: []);
  }

  /// `Call`
  String get Call {
    return Intl.message('Call', name: 'Call', desc: '', args: []);
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
