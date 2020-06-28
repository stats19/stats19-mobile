import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/match/presentation/bloc/soccer_match_bloc.dart';
import 'package:stat19_app_mobile/features/team/presentation/pages/team_page.dart';

class ScorePanel extends StatelessWidget {
  final int matchId;
  const ScorePanel({
    Key key, this.matchId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blueGrey[700],
            boxShadow: [
              BoxShadow(color: Colors.grey, spreadRadius: 3)
            ]
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
                    style: TextStyle(color: Colors.white,  fontSize: 17),
                  )),
            ],
          )),
      width: 120,
      height: 70,
    );

  }
}
