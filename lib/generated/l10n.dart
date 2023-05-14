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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Hello World`
  String get helloFlutter {
    return Intl.message(
      'Hello World',
      name: 'helloFlutter',
      desc: '',
      args: [],
    );
  }

  /// `Potato Timer`
  String get homeTitle {
    return Intl.message(
      'Potato Timer',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Task`
  String get addTask {
    return Intl.message(
      'Add Task',
      name: 'addTask',
      desc: '',
      args: [],
    );
  }

  /// `HH`
  String get hourHint {
    return Intl.message(
      'HH',
      name: 'hourHint',
      desc: '',
      args: [],
    );
  }

  /// `MM`
  String get minHint {
    return Intl.message(
      'MM',
      name: 'minHint',
      desc: '',
      args: [],
    );
  }

  /// `SS`
  String get secHint {
    return Intl.message(
      'SS',
      name: 'secHint',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get titleText {
    return Intl.message(
      'Title',
      name: 'titleText',
      desc: '',
      args: [],
    );
  }

  /// `Superdesigner`
  String get hintTitleText {
    return Intl.message(
      'Superdesigner',
      name: 'hintTitleText',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get subtitleText {
    return Intl.message(
      'Description',
      name: 'subtitleText',
      desc: '',
      args: [],
    );
  }

  /// `e.g. john@gmail.com`
  String get hintSubtitleText {
    return Intl.message(
      'e.g. john@gmail.com',
      name: 'hintSubtitleText',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
