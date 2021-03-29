import 'package:flutter/material.dart';
import 'package:app_photo/generated/l10n.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        // Main Buttons
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: null,
                  child: Text(S.of(context).goToPage1buttonText)),
              ElevatedButton(
                  onPressed: null,
                  child: Text(S.of(context).openCamerabuttonText))
            ],
          ),
        ),
      ),
    );
  }
}
