import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/features/league/presentation/widgets/coming_matches.dart';

import 'widgets.dart';

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
                              LeagueRanking(leagueId: leagueId),
                              ComingMatch(leagueId: leagueId),
//
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