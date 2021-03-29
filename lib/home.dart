import 'package:app_photo/pagePhoto.dart';
import 'package:flutter/material.dart';
import 'package:app_photo/generated/l10n.dart';
import 'package:app_photo/page1.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
        // code for the menu ...
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (content) => [
              PopupMenuItem(
                  value: 1, child: Text(S.of(context).goToPage1buttonText)),
              PopupMenuItem(
                  value: 2, child: Text(S.of(context).openCamerabuttonText))
            ],
            onSelected: (int menuId) {
              if (menuId == 1) {
                // open page 1
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page1()));
              } else {
                // open camera
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Photo()));
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        // Main Buttons
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    // add code here to go to other page (Page 1)
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page1()));
                  },
                  child: Text(S.of(context).goToPage1buttonText)),
              ElevatedButton(
                  onPressed: () {
                    // add code here to open the camera
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Photo()));
                  },
                  child: Text(S.of(context).openCamerabuttonText))
            ],
          ),
        ),
      ),
    );
  }
}
