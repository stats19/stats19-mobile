import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/components/AppBar_components.dart';
import 'package:stat19_app_mobile/models/league-model.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';
import 'package:stat19_app_mobile/services/web_service.dart';

import 'HomeNav_view.dart';
import '../components/leagues-component.dart';
class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {

  WebService _ws = new WebService();
  bool _loading = false;
  Leagues _league;

  @override
  void initState(){
    super.initState();

    setState(() {
      _loading = true;
    });

    // API call to get league
    this._ws.getLeagues().then((Leagues league){
      this._league = league;
      setState(() {
        _loading = false;
      });
    });

  }

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
                (!_loading)
                ?
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Nom de league : ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("${_league.name}")
                        ],
                      )
                  )
                :
                  Center(
                    child: CupertinoActivityIndicator(),
                  )
              ],
            )
        )
      ),
    );
  }
}