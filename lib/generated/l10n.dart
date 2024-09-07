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
