import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/components/AppBar_components.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';

import 'HomeNav_view.dart';
import '../components/leagues-component.dart';
class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new Stat19SimpleAppBar(titleName: "Stats19"),
        drawer: new HomeNavigationBar(context:context), //TODO being able to close nav bar also by touching drawer icons
        body:Container(
            decoration: BoxDecoration(
              image: BODY_BACKGROUND_DECORATION_IMAGE,
            ),
            alignment: Alignment.topCenter,// Text('Hello the world!',textAlign: TextAlign.center),
            child: Column(
              children: <Widget>[
                Text('Hello the world!'),
                new LeaguesView(),
              ],
            )
        )
      ),
    );
  }
}