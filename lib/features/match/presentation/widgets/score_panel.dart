import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/match/presentation/bloc/soccer_match_bloc.dart';

class ScorePanel extends StatelessWidget {
  final int matchId;
  const ScorePanel({
    Key key, this.matchId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blue),
        margin: new EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<SoccerMatchBloc, SoccerMatchState>(
            builder: (context, state) {
          if (state is Empty) {
            BlocProvider.of<SoccerMatchBloc>(context).add(GetSoccerMatchEvent(matchId));
          } else if(state is Loading) {
            return CircularProgressIndicator();
          } else if (state is Loaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TeamScorePanel(
                  name: state.soccerMatch.homeTeam.name,
                ),
                Container(child: Text(state.soccerMatch.homeTeam.goals.toString() + ' - ' + state.soccerMatch.awayTeam.goals.toString() )),
                TeamScorePanel(
                  name: state.soccerMatch.awayTeam.name,
                ),
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

  const TeamScorePanel({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[Icon(Icons.score), Text(name,style: TextStyle(color: Colors.white,  fontSize: 10))],
      ),
      color: Colors.blue,
      width: 120,
      height: 110,
    );
  }
}
