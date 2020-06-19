import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/match/presentation/pages/soccer_match_page.dart';
import 'package:stat19_app_mobile/features/team/domain/entities/team.dart';
import 'package:stat19_app_mobile/features/team/presentation/bloc/team_bloc.dart';

class RecentMatches extends StatelessWidget {
  const RecentMatches({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Les derniers matchs",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          BlocBuilder<TeamBloc, TeamState>(builder: (context, state) {
            if (state is Loading) {
              return CircularProgressIndicator();
            } else if (state is Loaded) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.team.recentMatches
                      .map((e) => ResultBubble(recentMatch: e))
                      .toList());
            } else if (state is Error) {
              // return MessageDisplay(message: state.message);
              return Text('there is error' + state.message);
            }
            return Container();
          }),
        ],
      ),
    );
  }
}

class ResultBubble extends StatelessWidget {
  final RecentMatch recentMatch;

  const ResultBubble({
    Key key,
    this.recentMatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: recentMatch.result == "LOSE"
              ? Colors.redAccent
              : recentMatch.result == "DRAW" ? Colors.grey : Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: ButtonTheme(
        minWidth: 25,
        height: 25,
        padding: EdgeInsets.all(0),
        child: Align(
          child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SoccerMatchPage(
                    matchId: recentMatch.matchId,
                  );
                }));
              },
              textColor: Colors.white,
              child: Text(
                recentMatch.result == "LOSE"
                    ? "D"
                    : recentMatch.result == "DRAW" ? "N" : "V",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              )
//              child: Text("N", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),)
              ),
        ),
      ),
    );
  }
}
