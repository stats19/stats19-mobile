import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../league/presentation/pages/league_info_page.dart';
import '../../../team/presentation/pages/team_page.dart';
import '../bloc/soccer_match_bloc.dart';

class HeaderPanel extends StatelessWidget {
  final int matchId;
  const HeaderPanel({
    Key key, this.matchId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
          decoration: BoxDecoration(
            border: Border.all(color:  Colors.blueGrey[700], width: 0.5),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)
            ),
            color: Colors.blueGrey[500],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 9,
                spreadRadius: 2.0,
              )
            ],
          ),
//        margin: new EdgeInsets.symmetric(horizontal: 20.0),
        margin: new EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: BlocBuilder<SoccerMatchBloc, SoccerMatchState>(
            builder: (context, state) {
          if (state is Empty) {
            BlocProvider.of<SoccerMatchBloc>(context).add(GetSoccerMatchEvent(matchId));
          } else if(state is Loading) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            return Column(
              children: <Widget>[
                MatchLeagueButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TeamScorePanel(
                      name: state.soccerMatch.homeTeam.name,
                      teamId: state.soccerMatch.homeTeam.teamId,
                    ),
                    Container(child: Text(state.soccerMatch.homeTeam.goals.toString() + ' - ' + state.soccerMatch.awayTeam.goals.toString(), style: TextStyle(fontSize: 20, color: Colors.white))),
                    TeamScorePanel(
                      name: state.soccerMatch.awayTeam.name,
                      teamId: state.soccerMatch.homeTeam.teamId,
                    ),
                  ],
                ),
//                Container(
//                  child: Text("date"),
//                )
              ],
            );
          } else if (state is Error) {
            return Text('there is error' + state.message);
          }
          return Container();
        }));
  }
}

class TeamScorePanel extends StatelessWidget {
  final String name;
  final int teamId;
  const TeamScorePanel({
    Key key,
    @required this.name, this.teamId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                print(teamId);
                return TeamPage(
                  teamId: teamId,
                );
              }),
            );
          },
          child: Row(
            children: <Widget>[
              Flexible(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,  fontSize: 15),
                  )),
            ],
          )),
      width: 120,
      height: 70,
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
            elevation: 4,
            padding: EdgeInsets.only(
              top: 5,
              left: 10,
              right: 10,
              bottom: 5,
            ),
            color: Colors.blueGrey[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return LeagueInfoPage(
                      leagueId: state.soccerMatch.league.leagueId,
                    );
                  }));
            },
            child: Text(state.soccerMatch.league.name, style : TextStyle(color: Colors.white,  fontSize: 12,), textAlign: TextAlign.center,));

      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}
