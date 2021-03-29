// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(pathADD) => "\nPath application document directory: ${pathADD}";

  static m1(defLocale) => "Default Locale: ${defLocale}";

  static m2(pathESD) => "\nPath external storage directory: ${pathESD}";

  static m3(myLocale) => "My Locale: ${myLocale}";

  static m4(systemLocales) => "System Locales: \n ${systemLocales}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appBarTitlePage1Text" : MessageLookupByLibrary.simpleMessage("Store App Info"),
    "appName" : MessageLookupByLibrary.simpleMessage("Photo App"),
    "goToPage1buttonText" : MessageLookupByLibrary.simpleMessage("Go to page 1"),
    "infoAppDocumentsDirectoryText" : m0,
    "infoDefaultLocalePlaceholders" : m1,
    "infoDirecrotyText" : MessageLookupByLibrary.simpleMessage("\n\t App Directories:"),
    "infoExternalStorageDirectoryText" : m2,
    "infoMyLocalePlaceholders" : m3,
    "infoSystemLocalesPlaceholders" : m4,
    "openCamerabuttonText" : MessageLookupByLibrary.simpleMessage("Open Camera")
  };
}
