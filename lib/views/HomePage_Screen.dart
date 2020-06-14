import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/components/AppBar_components.dart';
import 'package:stat19_app_mobile/models/league-model.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';
import 'package:stat19_app_mobile/services/web_service.dart';

import 'HomeNav_view.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  WebService _ws = new WebService();
  bool _loading = false;
  LeaguesList _league;

  @override
  void initState() {
    super.initState();

    setState(() {
      _loading = true;
    });

    // API call to get league
    this._ws.getLeagues().then((LeaguesList leagues) {
      this._league = leagues;
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
          drawer: new HomeNavigationBar(context: context),
          //TODO being able to close nav bar also by touching drawer icons
          body: Container(
              decoration: BoxDecoration(
                image: BODY_BACKGROUND_DECORATION_IMAGE,
              ),
              alignment: Alignment.topCenter,
              // Text('Hello the world!',textAlign: TextAlign.center),
              child: Column(
                children: <Widget>[
                  Text('Hello the world!'),
                  (!_loading)
                      ? Container(
                      margin: const EdgeInsets.all(10.0),
                      child: (new ListView.builder(
                            shrinkWrap: true,
                            itemCount: this._league.leagues == null
                                ? 0
                                : this._league.leagues.length,
                            itemBuilder: (BuildContext context, int index) {
                              return new Card(
                                child:
                                    new Text(this._league.leagues[index].name),
                              );
                            },
                          )))
                      : Center(
                          child: CupertinoActivityIndicator(),
                        )
                ],
              ))),
    );
  }
}
