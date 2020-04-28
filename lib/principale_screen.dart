

import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/AppBar_components.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: new Stat19SimpleAppBar(titleName: "Stats19"), //TODO :Add Table view
        body: Container(
          decoration: BoxDecoration(
            image: BODY_BACKGROUND_DECORATION_IMAGE,
          ),
          alignment: Alignment.center,// Text('Hello the world!',textAlign: TextAlign.center),
          child: Text('Hello the world!'),
        ),
      ),
    );
  }
}