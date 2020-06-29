import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:stat19_app_mobile/features/league/presentation/pages/league_info_page.dart';
import 'package:stat19_app_mobile/features/navigation/presentation/widgets/bottom_bar.dart';
import 'package:stat19_app_mobile/features/match/presentation/bloc/soccer_match_bloc.dart';
import 'package:stat19_app_mobile/features/match/presentation/widgets/widgets.dart';

import '../../../../injection_container.dart';

class SoccerMatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  final int matchId;

  SoccerMatchPage({this.matchId});

  BlocProvider<SoccerMatchBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SoccerMatchBloc>(),
      child: Scaffold(
          appBar: AppBar(
            title: TitleMatch(matchId: matchId),
          ),
//          backgroundColor: Colors.blueGrey[900],
          backgroundColor: Colors.grey[300],
          body: MatchDetailsWidget(
            matchId: matchId,
          ),
          bottomNavigationBar: BottomBar()),
    );
  }
}

class MatchDetailsWidget extends StatelessWidget {
  final int matchId;

  const MatchDetailsWidget({
    Key key,
    this.matchId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          HeaderPanel(matchId: matchId),
          Expanded(
              child: DefaultTabController(
                  length: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                      ),
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 2.0,
                        )
                      ],
                    ),
                    margin: const EdgeInsets.only(
                          left: 20,
                          top: 0,
                          right: 20,
                        ),
                    child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                          ),

                            color: Colors.white70,
                            ),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                    child: TabBar(
                                        labelColor: Colors.blueAccent,
                                        unselectedLabelColor: Colors.grey,
                                        tabs: [
                                      Tab(
                                        text: "Temps fort",
                                      ),
                                      Tab(
                                        text: "Stats",
                                      ),
                                    ])),
                              ],
                            ),
                          ),
                          Expanded(
                              child: TabBarView(children: [
                            MatchHighlights(),
                            SoccerMatchStats()
                          ]))
                        ]),
                  )))
        ],
      ),
    );
  }
}




