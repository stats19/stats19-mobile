
import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/components/AppBar_components.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';

import 'components/DrawerView_component.dart';
import 'components/leagues-component.dart';
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
        drawer: new HomeNavigationBar(),
        body: Container(
          decoration: BoxDecoration(
            image: BODY_BACKGROUND_DECORATION_IMAGE,
          ),
          alignment: Alignment.topCenter,// Text('Hello the world!',textAlign: TextAlign.center),
          child: Row(
            children: <Widget>[
              Text('Hello the world!'),
              new LeaguesView(),
            ],
          )
        ),
      ),
    );
  }
}