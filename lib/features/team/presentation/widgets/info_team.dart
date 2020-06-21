import 'package:flutter/material.dart';

import 'widgets.dart';

class InfoTeam extends StatelessWidget {
  const InfoTeam({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: DefaultTabController(
              length: 3,
              child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Expanded(
                            child: TabBar(
                                labelStyle: TextStyle(fontSize: 15),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  Tab(text: "stats", ),
                                  Tab(text: "Match joué", ),
                                  Tab(text: "Futur match", ),
                                ]
                            )
                        ),
                      ],
                    ),
                    Expanded(
                        child: TabBarView(
                            children: [
                              TeamStats(),
                              EndedMatches(),
                              CommingMatches(),
                            ]
                        )
                    )
                  ]
              )
          ),
        )
    );
  }
}

