import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../match/presentation/pages/soccer_match_page.dart';
import '../../domain/entities/team.dart';
import '../bloc/team_bloc.dart';

class RecentMatches extends StatelessWidget {
  const RecentMatches({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 18),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 10,
            spreadRadius: 6.0,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Text("Les derniers matchs",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
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
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
              color: Colors.black.withOpacity(.7),
//              offset: Offset(6.0, 7.0),
            ),
          ],
//          border: Border.all(color:  Colors.white, width: 0.5),
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
