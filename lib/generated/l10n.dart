// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transporter/generated/intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Strings {
  Strings();

  static Strings? _current;

  static Strings get current {
    assert(_current != null,
        'No instance of Strings was loaded. Try to initialize the Strings delegate before accessing Strings.current.',);
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Strings();
      Strings._current = instance;

      return instance;
    });
  }

  static Strings of(BuildContext context) {
    final instance = Strings.maybeOf(context);
    assert(instance != null,
        'No instance of Strings present in the widget tree. Did you add Strings.delegate in localizationsDelegates?',);
    return instance!;
  }

  static Strings? maybeOf(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `Transporter`
  String get transporterAppBarTitle {
    return Intl.message(
      'Transporter',
      name: 'transporterAppBarTitle',
      desc: 'Text shown in the AppBar of the transporter Page',
      args: [],
    );
  }

  /// `Anywhere you are`
  String get onboarding_anywhere_heading {
    return Intl.message(
      'Anywhere you are',
      name: 'onboarding_anywhere_heading',
      desc: '',
      args: [],
    );
  }

  /// `Sell houses easily with the help of Listenoryx and to make this line big I am writing more.`
  String get onboarding_anywhere_description {
    return Intl.message(
      'Sell houses easily with the help of Listenoryx and to make this line big I am writing more.',
      name: 'onboarding_anywhere_description',
      desc: '',
      args: [],
    );
  }

  /// `At anytime`
  String get onboarding_anytime_heading {
    return Intl.message(
      'At anytime',
      name: 'onboarding_anytime_heading',
      desc: '',
      args: [],
    );
  }

  /// `Sell houses easily with the help of Listenoryx and to make this line big I am writing more.`
  String get onboarding_anytime_description {
    return Intl.message(
      'Sell houses easily with the help of Listenoryx and to make this line big I am writing more.',
      name: 'onboarding_anytime_description',
      desc: '',
      args: [],
    );
  }

  /// `Book your car`
  String get onboarding_book_car_heading {
    return Intl.message(
      'Book your car',
      name: 'onboarding_book_car_heading',
      desc: '',
      args: [],
    );
  }

  /// `Sell houses easily with the help of Listenoryx and to make this line big I am writing more.`
  String get onboarding_book_car_description {
    return Intl.message(
      'Sell houses easily with the help of Listenoryx and to make this line big I am writing more.',
      name: 'onboarding_book_car_description',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get onboarding_skip {
    return Intl.message(
      'Skip',
      name: 'onboarding_skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome_heading {
    return Intl.message(
      'Welcome',
      name: 'welcome_heading',
      desc: '',
      args: [],
    );
  }

  /// `Have a better sharing experience`
  String get welcome_subheading {
    return Intl.message(
      'Have a better sharing experience',
      name: 'welcome_subheading',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get welcome_create_account_label {
    return Intl.message(
      'Create an account',
      name: 'welcome_create_account_label',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get welcome_login_label {
    return Intl.message(
      'Log In',
      name: 'welcome_login_label',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get header_back_label {
    return Intl.message(
      'Back',
      name: 'header_back_label',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with your email or phone number`
  String get signup_heading {
    return Intl.message(
      'Sign up with your email or phone number',
      name: 'signup_heading',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get signup_name_field_label {
    return Intl.message(
      'Name',
      name: 'signup_name_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get signup_name_validation_label {
    return Intl.message(
      'Please enter your name',
      name: 'signup_name_validation_label',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signup_email_field_label {
    return Intl.message(
      'Email',
      name: 'signup_email_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get signup_email_validation_label {
    return Intl.message(
      'Please enter your email',
      name: 'signup_email_validation_label',
      desc: '',
      args: [],
    );
  }

  /// `Your mobile number`
  String get signup_phone_field_label {
    return Intl.message(
      'Your mobile number',
      name: 'signup_phone_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get signup_gender_field_label {
    return Intl.message(
      'Gender',
      name: 'signup_gender_field_label',
      desc: '',
      args: [],
    );
  }

  /// `By signing up, you agree to the `
  String get signup_terms_conditions_1 {
    return Intl.message(
      'By signing up, you agree to the ',
      name: 'signup_terms_conditions_1',
      desc: '',
      args: [],
    );
  }

  /// `Terms of service`
  String get signup_terms_conditions_2 {
    return Intl.message(
      'Terms of service',
      name: 'signup_terms_conditions_2',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get signup_terms_conditions_3 {
    return Intl.message(
      ' and ',
      name: 'signup_terms_conditions_3',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy.`
  String get signup_terms_conditions_4 {
    return Intl.message(
      'Privacy policy.',
      name: 'signup_terms_conditions_4',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup_button_label {
    return Intl.message(
      'Sign Up',
      name: 'signup_button_label',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or_separator {
    return Intl.message(
      'or',
      name: 'or_separator',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get signup_already_have_account_label {
    return Intl.message(
      'Already have an account? ',
      name: 'signup_already_have_account_label',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signin_label {
    return Intl.message(
      'Sign in',
      name: 'signin_label',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get gender_male {
    return Intl.message(
      'Male',
      name: 'gender_male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get gender_female {
    return Intl.message(
      'Female',
      name: 'gender_female',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with your email or phone number`
  String get signin_heading {
    return Intl.message(
      'Sign in with your email or phone number',
      name: 'signin_heading',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Password`
  String get signin_password_label {
    return Intl.message(
      'Enter your Password',
      name: 'signin_password_label',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get signin_password_validation_label {
    return Intl.message(
      'Please enter your password',
      name: 'signin_password_validation_label',
      desc: '',
      args: [],
    );
  }

  /// `Email or Phone Number`
  String get signin_email_or_phone {
    return Intl.message(
      'Email or Phone Number',
      name: 'signin_email_or_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email or phone number`
  String get signin_validation_email_or_phone {
    return Intl.message(
      'Please enter your email or phone number',
      name: 'signin_validation_email_or_phone',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get signin_forgot_password_label {
    return Intl.message(
      'Forgot Password?',
      name: 'signin_forgot_password_label',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get signin_dont_have_account_label {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'signin_dont_have_account_label',
      desc: '',
      args: [],
    );
  }

  /// `Set New Password`
  String get set_new_password_heading {
    return Intl.message(
      'Set New Password',
      name: 'set_new_password_heading',
      desc: '',
      args: [],
    );
  }

  /// `Set your new password`
  String get set_new_password_subheading {
    return Intl.message(
      'Set your new password',
      name: 'set_new_password_subheading',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Password`
  String get new_password_label {
    return Intl.message(
      'Enter Your New Password',
      name: 'new_password_label',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your new password`
  String get new_password_validation {
    return Intl.message(
      'Please enter your new password',
      name: 'new_password_validation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password_label {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password_label',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get confirm_password_validation {
    return Intl.message(
      'Please enter your password',
      name: 'confirm_password_validation',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 number or a special character`
  String get confirm_password_rule_validation {
    return Intl.message(
      'At least 1 number or a special character',
      name: 'confirm_password_rule_validation',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save_button_label {
    return Intl.message(
      'Save',
      name: 'save_button_label',
      desc: '',
      args: [],
    );
  }

  /// `Phone verification`
  String get verify_phone_heading {
    return Intl.message(
      'Phone verification',
      name: 'verify_phone_heading',
      desc: '',
      args: [],
    );
  }

  /// `Enter your OTP code`
  String get verify_phone_subheading {
    return Intl.message(
      'Enter your OTP code',
      name: 'verify_phone_subheading',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive code? `
  String get verify_didnt_receive_label {
    return Intl.message(
      'Didn\'t receive code? ',
      name: 'verify_didnt_receive_label',
      desc: '',
      args: [],
    );
  }

  /// `Resend again`
  String get verify_resend_label {
    return Intl.message(
      'Resend again',
      name: 'verify_resend_label',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify_button_label {
    return Intl.message(
      'Verify',
      name: 'verify_button_label',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get menu_history_label {
    return Intl.message(
      'History',
      name: 'menu_history_label',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get menu_profile_label {
    return Intl.message(
      'Profile',
      name: 'menu_profile_label',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get menu_settings_label {
    return Intl.message(
      'Settings',
      name: 'menu_settings_label',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get menu_logout_label {
    return Intl.message(
      'Logout',
      name: 'menu_logout_label',
      desc: '',
      args: [],
    );
  }

  /// `Help and Support`
  String get menu_help_label {
    return Intl.message(
      'Help and Support',
      name: 'menu_help_label',
      desc: '',
      args: [],
    );
  }

  /// `Referral`
  String get menu_referral_label {
    return Intl.message(
      'Referral',
      name: 'menu_referral_label',
      desc: '',
      args: [],
    );
  }

  /// `Complain`
  String get menu_complain_label {
    return Intl.message(
      'Complain',
      name: 'menu_complain_label',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get menu_about_label {
    return Intl.message(
      'About Us',
      name: 'menu_about_label',
      desc: '',
      args: [],
    );
  }

  /// `Rental`
  String get home_rental_button_heading {
    return Intl.message(
      'Rental',
      name: 'home_rental_button_heading',
      desc: '',
      args: [],
    );
  }

  /// `Transport`
  String get home_transport_button_heading {
    return Intl.message(
      'Transport',
      name: 'home_transport_button_heading',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get home_delivery_button_heading {
    return Intl.message(
      'Delivery',
      name: 'home_delivery_button_heading',
      desc: '',
      args: [],
    );
  }

  /// `Where would you go?`
  String get home_address_input_hint {
    return Intl.message(
      'Where would you go?',
      name: 'home_address_input_hint',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottom_navigation_home_label {
    return Intl.message(
      'Home',
      name: 'bottom_navigation_home_label',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get bottom_navigation_fav_label {
    return Intl.message(
      'Favourite',
      name: 'bottom_navigation_fav_label',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get bottom_navigation_wallet_label {
    return Intl.message(
      'Wallet',
      name: 'bottom_navigation_wallet_label',
      desc: '',
      args: [],
    );
  }

  /// `Offer`
  String get bottom_navigation_offer_label {
    return Intl.message(
      'Offer',
      name: 'bottom_navigation_offer_label',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get bottom_navigation_profile_label {
    return Intl.message(
      'Profile',
      name: 'bottom_navigation_profile_label',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'rw'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
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
