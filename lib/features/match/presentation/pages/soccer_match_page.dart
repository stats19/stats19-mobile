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
          backgroundColor: Colors.blueGrey[900],
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
          Padding(
              padding: EdgeInsets.all(15),
              child: MatchLeagueButton()
          ),

          ScorePanel(matchId: matchId),
          Expanded(
              child: DefaultTabController(
                  length: 2,
                  child: Container(

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
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)
                              ),
                            color: Colors.white30,
                            ),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                    child: TabBar(
                                        labelColor: Colors.white,
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



class MatchLeagueButton extends StatelessWidget {

  const MatchLeagueButton({
    Key key,
    @required this.matchId,
  }) : super(key: key);

  final int matchId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoccerMatchBloc, SoccerMatchState>(builder: (context, state) {
      if ((state is Empty)) {
        BlocProvider.of<SoccerMatchBloc>(context).add(GetSoccerMatchEvent(matchId));
        return Text("league");
      } else if (state is Loaded) {
        return RaisedButton(
            padding: EdgeInsets.only(
              top: 5,
              left: 10,
              right: 10,
              bottom: 5,
            ),
            color: Colors.blueGrey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                side: BorderSide(color: Colors.red)
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return LeagueInfoPage(
                      leagueId: state.soccerMatch.league.leagueId,
                    );
                  }));
            },
            child: Text(state.soccerMatch.league.name, style : TextStyle(color: Colors.white,  fontSize: 18,), textAlign: TextAlign.center,));

      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}
