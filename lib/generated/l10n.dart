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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `MayFairll Companey`
  String get title {
    return Intl.message(
      'MayFairll Companey',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get register {
    return Intl.message(
      'Sign Up',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get login {
    return Intl.message(
      'Sign In',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Quick Sign In`
  String get quick_login {
    return Intl.message(
      'Quick Sign In',
      name: 'quick_login',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign in with`
  String get or_login_with {
    return Intl.message(
      'Or Sign in with',
      name: 'or_login_with',
      desc: '',
      args: [],
    );
  }

  /// `login with google account`
  String get login_with_google {
    return Intl.message(
      'login with google account',
      name: 'login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get not_have_account {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `user name`
  String get user_name {
    return Intl.message(
      'user name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `phone`
  String get phone {
    return Intl.message(
      'phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `please enter the user name`
  String get please_enter_user_name {
    return Intl.message(
      'please enter the user name',
      name: 'please_enter_user_name',
      desc: '',
      args: [],
    );
  }

  /// `please enter a valid email`
  String get please_enter_email {
    return Intl.message(
      'please enter a valid email',
      name: 'please_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `please enter a valid phone`
  String get please_enter_phone {
    return Intl.message(
      'please enter a valid phone',
      name: 'please_enter_phone',
      desc: '',
      args: [],
    );
  }

  /// `please enter  a valid password`
  String get please_enter_password {
    return Intl.message(
      'please enter  a valid password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `welcome`
  String get welcome {
    return Intl.message(
      'welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Discover your next adventure with us! we're here to make your travel dreams come true. Let's explore the world together!`
  String get welcome_login_text {
    return Intl.message(
      'Discover your next adventure with us! we\'re here to make your travel dreams come true. Let\'s explore the world together!',
      name: 'welcome_login_text',
      desc: '',
      args: [],
    );
  }

  /// `Your gateway to the world's most amazing destinations. Let's explore together!`
  String get welcome_register_text {
    return Intl.message(
      'Your gateway to the world\'s most amazing destinations. Let\'s explore together!',
      name: 'welcome_register_text',
      desc: '',
      args: [],
    );
  }

  /// `Driver`
  String get driver {
    return Intl.message(
      'Driver',
      name: 'driver',
      desc: '',
      args: [],
    );
  }

  /// `Drivers`
  String get drivers {
    return Intl.message(
      'Drivers',
      name: 'drivers',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message(
      'Chats',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `menu`
  String get menu {
    return Intl.message(
      'menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `users`
  String get users {
    return Intl.message(
      'users',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `customer`
  String get customer {
    return Intl.message(
      'customer',
      name: 'customer',
      desc: '',
      args: [],
    );
  }

  /// `Type Your Message`
  String get type_your_message {
    return Intl.message(
      'Type Your Message',
      name: 'type_your_message',
      desc: '',
      args: [],
    );
  }

  /// `cancle`
  String get cancle {
    return Intl.message(
      'cancle',
      name: 'cancle',
      desc: '',
      args: [],
    );
  }

  /// `New Driver`
  String get new_driver {
    return Intl.message(
      'New Driver',
      name: 'new_driver',
      desc: '',
      args: [],
    );
  }

  /// `Connected`
  String get connected {
    return Intl.message(
      'Connected',
      name: 'connected',
      desc: '',
      args: [],
    );
  }

  /// `Not Connected`
  String get dis_connected {
    return Intl.message(
      'Not Connected',
      name: 'dis_connected',
      desc: '',
      args: [],
    );
  }

  /// `no drivers yet`
  String get no_drivers_yet {
    return Intl.message(
      'no drivers yet',
      name: 'no_drivers_yet',
      desc: '',
      args: [],
    );
  }

  /// `The email address is badly formatted.`
  String get error_invalid_email {
    return Intl.message(
      'The email address is badly formatted.',
      name: 'error_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `The user account has been disabled.`
  String get error_user_disabled {
    return Intl.message(
      'The user account has been disabled.',
      name: 'error_user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email`
  String get error_user_not_found {
    return Intl.message(
      'No user found for that email',
      name: 'error_user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get error_wrong_password {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'error_wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get error_email_already_in_use {
    return Intl.message(
      'The account already exists for that email.',
      name: 'error_email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Email Or Password is not correct`
  String get error_invalid_credential {
    return Intl.message(
      'Email Or Password is not correct',
      name: 'error_invalid_credential',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred.`
  String get error_unknown {
    return Intl.message(
      'An unknown error occurred.',
      name: 'error_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Sign-in process was aborted by the user.`
  String get error_google_sign_in_account {
    return Intl.message(
      'Sign-in process was aborted by the user.',
      name: 'error_google_sign_in_account',
      desc: '',
      args: [],
    );
  }

  /// `Failed to authenticate Google account.`
  String get error_google_sign_in_authentication {
    return Intl.message(
      'Failed to authenticate Google account.',
      name: 'error_google_sign_in_authentication',
      desc: '',
      args: [],
    );
  }

  /// `You do not have permission to perform this action.`
  String get error_permission_denied {
    return Intl.message(
      'You do not have permission to perform this action.',
      name: 'error_permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `The service is currently unavailable. Try again later.`
  String get error_unavailable {
    return Intl.message(
      'The service is currently unavailable. Try again later.',
      name: 'error_unavailable',
      desc: '',
      args: [],
    );
  }

  /// `The requested resource was not found.`
  String get error_not_found {
    return Intl.message(
      'The requested resource was not found.',
      name: 'error_not_found',
      desc: '',
      args: [],
    );
  }

  /// `The document already exists.`
  String get error_already_exists {
    return Intl.message(
      'The document already exists.',
      name: 'error_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `The operation was cancelled.`
  String get error_cancelled {
    return Intl.message(
      'The operation was cancelled.',
      name: 'error_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `The operation took too long. Please try again.`
  String get error_deadline_exceeded {
    return Intl.message(
      'The operation took too long. Please try again.',
      name: 'error_deadline_exceeded',
      desc: '',
      args: [],
    );
  }

  /// `Quota or other resources have been exhausted.`
  String get error_resource_exhausted {
    return Intl.message(
      'Quota or other resources have been exhausted.',
      name: 'error_resource_exhausted',
      desc: '',
      args: [],
    );
  }

  /// `The request could not be completed due to precondition failure.`
  String get error_failed_precondition {
    return Intl.message(
      'The request could not be completed due to precondition failure.',
      name: 'error_failed_precondition',
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
