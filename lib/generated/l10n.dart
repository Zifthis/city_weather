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

  /// `City Weather`
  String get city_weather {
    return Intl.message(
      'City Weather',
      name: 'city_weather',
      desc: '',
      args: [],
    );
  }

  /// `Weather Screen`
  String get weather_screen {
    return Intl.message(
      'Weather Screen',
      name: 'weather_screen',
      desc: '',
      args: [],
    );
  }

  /// `Search and add your locations to the list`
  String get error_search {
    return Intl.message(
      'Search and add your locations to the list',
      name: 'error_search',
      desc: '',
      args: [],
    );
  }

  /// `Search City`
  String get search_city {
    return Intl.message(
      'Search City',
      name: 'search_city',
      desc: '',
      args: [],
    );
  }

  /// `Saved Locations`
  String get location_list {
    return Intl.message(
      'Saved Locations',
      name: 'location_list',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get server_error {
    return Intl.message(
      'Server Error',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get server_error_description {
    return Intl.message(
      'Something went wrong!',
      name: 'server_error_description',
      desc: '',
      args: [],
    );
  }

  /// `Dio Error`
  String get dio_error {
    return Intl.message(
      'Dio Error',
      name: 'dio_error',
      desc: '',
      args: [],
    );
  }

  /// `is already in the list!`
  String get already_in_list {
    return Intl.message(
      'is already in the list!',
      name: 'already_in_list',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection!`
  String get no_internet {
    return Intl.message(
      'Check your internet connection!',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `added the list!`
  String get added_to {
    return Intl.message(
      'added the list!',
      name: 'added_to',
      desc: '',
      args: [],
    );
  }

  /// `removed from the list!`
  String get removed_from {
    return Intl.message(
      'removed from the list!',
      name: 'removed_from',
      desc: '',
      args: [],
    );
  }

  /// `List is empty!`
  String get list_empty {
    return Intl.message(
      'List is empty!',
      name: 'list_empty',
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

  /// `Weather App, but simplified :)`
  String get app_home_title {
    return Intl.message(
      'Weather App, but simplified :)',
      name: 'app_home_title',
      desc: '',
      args: [],
    );
  }

  /// `Show Profile`
  String get show_profile {
    return Intl.message(
      'Show Profile',
      name: 'show_profile',
      desc: '',
      args: [],
    );
  }

  /// `Loading Weather`
  String get loading_weather {
    return Intl.message(
      'Loading Weather',
      name: 'loading_weather',
      desc: '',
      args: [],
    );
  }

  /// `City Name`
  String get city_name {
    return Intl.message(
      'City Name',
      name: 'city_name',
      desc: '',
      args: [],
    );
  }

  /// `Feels Like: `
  String get feels_like {
    return Intl.message(
      'Feels Like: ',
      name: 'feels_like',
      desc: '',
      args: [],
    );
  }

  /// `Temperature: `
  String get temperature {
    return Intl.message(
      'Temperature: ',
      name: 'temperature',
      desc: '',
      args: [],
    );
  }

  /// ` °C`
  String get temperature_symbol {
    return Intl.message(
      ' °C',
      name: 'temperature_symbol',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong! `
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong! ',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get sign_out {
    return Intl.message(
      'Sign Out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get no_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get have_account {
    return Intl.message(
      'Already have an account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Enter the city name`
  String get enter_city_name {
    return Intl.message(
      'Enter the city name',
      name: 'enter_city_name',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get valid_email {
    return Intl.message(
      'Enter a valid email',
      name: 'valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter min. 6 characters`
  String get min_requirements {
    return Intl.message(
      'Enter min. 6 characters',
      name: 'min_requirements',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
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
