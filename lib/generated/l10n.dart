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
