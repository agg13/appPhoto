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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Photo App`
  String get appName {
    return Intl.message(
      'Photo App',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Go to page 1`
  String get goToPage1buttonText {
    return Intl.message(
      'Go to page 1',
      name: 'goToPage1buttonText',
      desc: '',
      args: [],
    );
  }

  /// `Open Camera`
  String get openCamerabuttonText {
    return Intl.message(
      'Open Camera',
      name: 'openCamerabuttonText',
      desc: '',
      args: [],
    );
  }

  /// `Store App Info`
  String get appBarTitlePage1Text {
    return Intl.message(
      'Store App Info',
      name: 'appBarTitlePage1Text',
      desc: '',
      args: [],
    );
  }

  /// `Default Locale: {defLocale}`
  String infoDefaultLocalePlaceholders(Object defLocale) {
    return Intl.message(
      'Default Locale: $defLocale',
      name: 'infoDefaultLocalePlaceholders',
      desc: '',
      args: [defLocale],
    );
  }

  /// `My Locale: {myLocale}`
  String infoMyLocalePlaceholders(Object myLocale) {
    return Intl.message(
      'My Locale: $myLocale',
      name: 'infoMyLocalePlaceholders',
      desc: '',
      args: [myLocale],
    );
  }

  /// `System Locales: \n {systemLocales}`
  String infoSystemLocalesPlaceholders(Object systemLocales) {
    return Intl.message(
      'System Locales: \n $systemLocales',
      name: 'infoSystemLocalesPlaceholders',
      desc: '',
      args: [systemLocales],
    );
  }

  /// `\n	 App Directories:`
  String get infoDirecrotyText {
    return Intl.message(
      '\n	 App Directories:',
      name: 'infoDirecrotyText',
      desc: '',
      args: [],
    );
  }

  /// `\nPath application document directory: {pathADD}`
  String infoAppDocumentsDirectoryText(Object pathADD) {
    return Intl.message(
      '\nPath application document directory: $pathADD',
      name: 'infoAppDocumentsDirectoryText',
      desc: '',
      args: [pathADD],
    );
  }

  /// `\nPath external storage directory: {pathESD}`
  String infoExternalStorageDirectoryText(Object pathESD) {
    return Intl.message(
      '\nPath external storage directory: $pathESD',
      name: 'infoExternalStorageDirectoryText',
      desc: '',
      args: [pathESD],
    );
  }

  /// `Ok`
  String get alertDialogTextOkButton {
    return Intl.message(
      'Ok',
      name: 'alertDialogTextOkButton',
      desc: '',
      args: [],
    );
  }

  /// `Image Bad Quality`
  String get alertDialogPhotoNOKTitleText {
    return Intl.message(
      'Image Bad Quality',
      name: 'alertDialogPhotoNOKTitleText',
      desc: '',
      args: [],
    );
  }

  /// `The images does not meet the necessary characteristics`
  String get alertDialogPhotoNOKContentText {
    return Intl.message(
      'The images does not meet the necessary characteristics',
      name: 'alertDialogPhotoNOKContentText',
      desc: '',
      args: [],
    );
  }

  /// `Image Good Quality`
  String get alertDialogPhotoOKTitleText {
    return Intl.message(
      'Image Good Quality',
      name: 'alertDialogPhotoOKTitleText',
      desc: '',
      args: [],
    );
  }

  /// `The image will be saved locally and sent to the API`
  String get alertDialogPhotoOKContentText {
    return Intl.message(
      'The image will be saved locally and sent to the API',
      name: 'alertDialogPhotoOKContentText',
      desc: '',
      args: [],
    );
  }

  /// `Picture Captured`
  String get titlePictureDisplayText {
    return Intl.message(
      'Picture Captured',
      name: 'titlePictureDisplayText',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get savePictureButtonText {
    return Intl.message(
      'Save',
      name: 'savePictureButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Generated number: {randNumGenerated} implies {isPictureOk}`
  String infoRandomNumberGeneratorText(Object randNumGenerated, Object isPictureOk) {
    return Intl.message(
      'Generated number: $randNumGenerated implies $isPictureOk',
      name: 'infoRandomNumberGeneratorText',
      desc: '',
      args: [randNumGenerated, isPictureOk],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'MX'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}