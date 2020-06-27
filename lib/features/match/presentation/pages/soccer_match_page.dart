import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
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
    return Column(
      children: <Widget>[

        // TODO ajouter league name
        Padding(
            padding: EdgeInsets.all(20),
//            child: Text("LEAGUE")
            child: MatchLeagueButton()
        ),

        ScorePanel(matchId: matchId),
        Expanded(
            child: DefaultTabController(
                length: 2,
                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Expanded(
                              child: TabBar(
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,
                                  tabs: [
                                Tab(
                                  text: "Temps fort",
                                ),
                                Tab(
                                  text: "statistique",
                                ),
                              ])),
                        ],
                      ),
                      Expanded(
                          child: TabBarView(children: [
                        MatchHighlights(),
                        SoccerMatchStats()
                      ]))
                    ])))
      ],
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
        return Container();
      } else if (state is Loaded) {
        return RaisedButton(
            padding: EdgeInsets.only(
              top: 5,
              left: 10,
              right: 10,
              bottom: 5,
            ),
//            decoration: BoxDecoration(
//                color: Colors.blueGrey,
//                borderRadius: BorderRadius.all(Radius.circular(15))
//            ),
            child: Text(state.soccerMatch.league.name, style : TextStyle(color: Colors.white,  fontSize: 18,), textAlign: TextAlign.center,));

//        return Text(state.soccerMatch.league.name);
      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}
