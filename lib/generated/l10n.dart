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

  /// `Вхід`
  String get exit {
    return Intl.message(
      'Вхід',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Усі`
  String get all {
    return Intl.message(
      'Усі',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Робочі`
  String get works {
    return Intl.message(
      'Робочі',
      name: 'works',
      desc: '',
      args: [],
    );
  }

  /// `Особисті`
  String get personal {
    return Intl.message(
      'Особисті',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `Створити`
  String get create {
    return Intl.message(
      'Створити',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Видалити`
  String get delete {
    return Intl.message(
      'Видалити',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Назва завдання...`
  String get nameTask {
    return Intl.message(
      'Назва завдання...',
      name: 'nameTask',
      desc: '',
      args: [],
    );
  }

  /// `Термінове`
  String get urgent {
    return Intl.message(
      'Термінове',
      name: 'urgent',
      desc: '',
      args: [],
    );
  }

  /// `Дата завершення:`
  String get endDate {
    return Intl.message(
      'Дата завершення:',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Прикріпити файл`
  String get attachFile {
    return Intl.message(
      'Прикріпити файл',
      name: 'attachFile',
      desc: '',
      args: [],
    );
  }

  /// `Додати опис...`
  String get addDescription {
    return Intl.message(
      'Додати опис...',
      name: 'addDescription',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'uk'),
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
