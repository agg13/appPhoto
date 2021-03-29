import 'dart:developer';
import 'dart:io';
import 'package:app_photo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Page1 extends StatefulWidget {
  @override
  State createState() => new Page1State();
}

class Page1State extends State<Page1> {
  var _result;
  Directory appDocumentDirectory;
  Directory appExternalStorageDirectory;

  @override
  void initState() {
    super.initState();
    getDir().then((result) => {
          setState(() {
            _result = result;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      return new Container();
    }
    Locale myLocale = Localizations.localeOf(context);
    String defaultLocale = Platform.localeName;
    List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
    log("[AGG-T] Default Locale: $defaultLocale");
    log("[AGG-T] My Locale: ${myLocale.toString()}");
    log("[AGG-T] Sysem Locales:");
    String allLocales = "";
    for (Locale loc in systemLocales) {
      log("[AGG-T] : ${loc.toString()}");
      allLocales = allLocales + ":" + loc.toString();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).appBarTitlePage1Text),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  Text(S
                      .of(context)
                      .infoDefaultLocalePlaceholders(defaultLocale)),
                  Text(S.of(context).infoMyLocalePlaceholders(myLocale)),
                  Text(S.of(context).infoSystemLocalesPlaceholders(allLocales)),
                  Text(S.of(context).infoDirecrotyText),
                  Text(S.of(context).infoAppDocumentsDirectoryText(
                      appDocumentDirectory.path)),
                  Text(S.of(context).infoExternalStorageDirectoryText(
                      appExternalStorageDirectory.path))
                ],
              ),
            ),
          )),
    );
  }

  Future<bool> getDir() async {
    appDocumentDirectory = await getApplicationDocumentsDirectory();
    appExternalStorageDirectory = await getExternalStorageDirectory();
    log("Path application document directory: ${appDocumentDirectory.path}");
    log("Path externl storage directory: ${appExternalStorageDirectory.path}");
    return true;
  }
}
