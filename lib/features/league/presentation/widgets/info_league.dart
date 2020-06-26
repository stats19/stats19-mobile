import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/features/league/presentation/widgets/comming_matches.dart';

class InfoLeague extends StatelessWidget {
  final int leagueId;
  const InfoLeague({
    Key key, this.leagueId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white30,
//              borderRadius: BorderRadius.all(Radius.circular(15))
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15)
              )
          ),
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: DefaultTabController(
              length: 2,
              child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Expanded(
                            child: TabBar(
                                labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(text: "Match à venir", ),
                                  Tab(text: "Classement", ),
                                ]
                            )
                        ),
                      ],
                    ),
                    Expanded(
                        child: TabBarView(
                            children: [
                              FuturMatch(leagueId: leagueId),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(20.0),
                                child: Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      Text('Cell 1'),
                                      Text('Cell 2'),
                                      Text('Cell 3'),
                                    ]),
                                    TableRow(children: [
                                      Text('Cell 4'),
                                      Text('Cell 5'),
                                      Text('Cell 6'),
                                    ])
                                  ],
                                ),
                              )                            ]
                        )
                    )
                  ]
              )
          ),
        )
    );
  }
}