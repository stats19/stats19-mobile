import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/team.dart';
import '../bloc/team_bloc.dart';

class EndedMatches extends StatelessWidget {
  const EndedMatches({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(builder: (context, state) {
      if (state is Loading) {
        return Container();
      } else if (state is Loaded) {
        return Container(
            child: ListView(
              primary: false,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
//          primary: false,
              children: <Widget>[
                Column(
                    children: state.team.playedMatches
                        .map((e) => EndedMatch(playedMatch: e))
                        .toList())
              ],
            ));
      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}

class EndedMatch extends StatelessWidget {
  final PlayedMatch playedMatch;

  const EndedMatch({
    Key key,
    this.playedMatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var win = LinearGradient(
      colors: [Colors.green, Colors.white, Colors.redAccent],
      begin: Alignment.centerLeft,
      stops: [
        0.49,
        0.50,
        0.51
      ],
      end: Alignment.centerRight,
    );
    var lose = LinearGradient(
      colors: [Colors.redAccent, Colors.white, Colors.green],
      begin: Alignment.centerLeft,
      stops: [
        0.49,
        0.50,
        0.51
      ],
      end: Alignment.centerRight,
    );
    var draw = LinearGradient(
      colors: [Colors.grey, Colors.white, Colors.grey],
      begin: Alignment.centerLeft,
      stops: [
        0.49,
        0.50,
        0.51
      ],
      end: Alignment.centerRight,
    );
    var notyet = LinearGradient(
      colors: [Colors.black, Colors.white, Colors.black],
      begin: Alignment.centerLeft,
      stops: [
        0.49,
        0.50,
        0.51
      ],
      end: Alignment.centerRight,
    );

    Gradient gradient = playedMatch.result == 'WIN'
        ? win
        : playedMatch.result == 'DRAW'
        ? draw
        : playedMatch.result == 'LOSE' ? lose: notyet;
    Color color = playedMatch.result == 'WIN'
        ? Colors.green
        : playedMatch.result == 'DRAW'
        ? Colors.yellow
        : playedMatch.result == 'LOSE' ? Colors.red : Colors.black;
    final String formatted =
    DateFormat.yMMMMEEEEd().format(DateTime.parse(playedMatch.date));
    return FlatButton(

        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          child: Column(
            children: <Widget>[
              Text(
                playedMatch.home.goals.toString() + ' - ' + playedMatch.away.goals.toString(),
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.white, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 6,
                      )
                    ],
                    gradient: gradient
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          playedMatch.home.name,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          playedMatch.away.name,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                width : MediaQuery.of(context).size.width,
                child: Text(
                  formatted,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ));
  }
}


//class EndedMatch extends StatelessWidget {
//  final PlayedMatch playedMatch;
//
//  const EndedMatch({
//    Key key,
//    this.playedMatch,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    Color color = playedMatch.result == 'WIN'
//        ? Colors.green
//        : playedMatch.result == 'DRAW'
//        ? Colors.yellow
//        : playedMatch.result == 'LOSE' ? Colors.red : Colors.black;
//    return FlatButton(
//        child: Container(
//          width: MediaQuery.of(context).size.width * 0.8,
//          decoration: BoxDecoration(
//              color: color.withOpacity(0.5),
//              borderRadius: BorderRadius.all(Radius.circular(15)),
//              border: Border.all(width: 0.5),
//              boxShadow: [
//                BoxShadow(color: Colors.grey, spreadRadius: 1)
//              ]
//          ),
//          child: Column(
//            children: <Widget>[
//              Text(playedMatch.date, style: TextStyle(color: Colors.white),),
//              Text(
//                playedMatch.home.name + ' - ' + playedMatch.away.name,
//                style: TextStyle(fontSize: 15, color: Colors.white),
//              ),
//            ],
//          ),
//        ));
//  }
//}
//class EndedMatches extends StatelessWidget {
//  const EndedMatches({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return BlocBuilder<TeamBloc, TeamState>(builder: (context, state) {
//      if (state is Loading) {
//        return Container();
//      } else if (state is Loaded) {
//        return Container(
//            child: ListView(
//              physics: const ClampingScrollPhysics(),
//              shrinkWrap: true,
//          primary: false,
//          children: <Widget>[
//            Column(
//              children: state.team.playedMatches.map((e) => EndedMatch(playedMatch: e)).toList()
//            )
//          ],
//        ));
//      } else if (state is Error) {
//        return Text('there is error' + state.message);
//      }
//      return Container();
//    });
//  }
//}
//
//class EndedMatch extends StatelessWidget {
//  final PlayedMatch playedMatch;
//  const EndedMatch({
//    Key key,
//    this.playedMatch,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    //TODO afficher score
//    Color color = playedMatch.result == 'WIN'
//        ? Colors.green
//        : playedMatch.result == 'DRAW'
//        ? Colors.yellow
//        : playedMatch.result == 'LOSE' ? Colors.red : Colors.black;
//    return FlatButton(
//        onPressed: () {
//          Navigator.push(context,
//              MaterialPageRoute(builder: (BuildContext context) {
//            return SoccerMatchPage(
//              matchId: playedMatch.matchId,
//            );
//          }));
//        },
//        child: Container(
//          width: MediaQuery.of(context).size.width * 0.8,
//          decoration: BoxDecoration(
//              color: color.withOpacity(0.5),
//              borderRadius: BorderRadius.all(Radius.circular(15)),
//              border: Border.all(width: 0.5),
//              boxShadow: [
//                BoxShadow(color: Colors.grey, spreadRadius: 1)
//              ]
//          ),
//          child: Column(
//            children: <Widget>[
//              Text(playedMatch.home.goals.toString() + ' - ' + playedMatch.away.goals.toString() ),
//              Container(
//                child: Text(
//                  playedMatch.home.name + ' - ' + playedMatch.away.name,
//                  style: TextStyle(
//                      fontSize: 15,
//                      color: Colors.white
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ));
//  }
//}
