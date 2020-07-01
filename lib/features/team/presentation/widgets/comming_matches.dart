import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/team.dart';
import '../bloc/team_bloc.dart';

class ComingMatches extends StatelessWidget {
  const ComingMatches({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(builder: (context, state) {
      if (state is Loading) {
        return Container();
      } else if (state is Loaded) {
        return Container(
            color: Colors.white30,
            child: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
//          primary: false,
          children: <Widget>[
            Column(
                children: state.team.nextMatches
                    .map((e) => CommingMatch(nextMatch: e))
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


class CommingMatch extends StatelessWidget {
  final NextMatch nextMatch;

  const CommingMatch({
    Key key,
    this.nextMatch,
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

    final String homewin  = (nextMatch.homeTeam.toString() + "_WIN");
    final String awaywin  = (nextMatch.homeTeam.toString() + "_LOSE");

    Gradient gradient = (nextMatch.homeTeam + '_' + nextMatch.forecastMatch).toString() == homewin
        ? win
        :  nextMatch.forecastMatch == 'DRAW'
        ? draw
        : (nextMatch.homeTeam + '_' + nextMatch.forecastMatch) == awaywin ? lose: notyet;

    final String formatted =
    DateFormat.yMMMMEEEEd().format(DateTime.parse(nextMatch.date));
    return FlatButton(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      "day" + nextMatch.stage.toString(),
                      style: TextStyle(color: Colors.blueGrey[500]), textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      formatted,
                      style: TextStyle(color: Colors.blueGrey[500]), textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5),
                width : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.white, width: 1),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: Colors.black.withOpacity(.7),
                      )
                    ],
                    gradient: gradient
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                          child: Text(
                            nextMatch.homeTeam,
                            style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
//                    Expanded(
//                      flex: 2,
//                      child: Center(
//                        child: Padding(
//                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
//                          child: Text(
//                            playedMatch.home.goals.toString() + '   ' + playedMatch.away.goals.toString(),
//                            style: TextStyle(
//                                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                          child: Text(
                            nextMatch.awayTeam,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}


//class CommingMatch extends StatelessWidget {
//  final NextMatch nextMatch;
//
//  const CommingMatch({
//    Key key,
//    this.nextMatch,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    var win = LinearGradient(
//          colors: [Colors.green, Colors.white, Colors.redAccent],
//          begin: Alignment.centerLeft,
//          stops: [
//            0.49,
//            0.50,
//            0.51
//          ],
//          end: Alignment.centerRight,
//        );
//    var lose = LinearGradient(
//      colors: [Colors.redAccent, Colors.white, Colors.green],
//      begin: Alignment.centerLeft,
//      stops: [
//        0.49,
//        0.50,
//        0.51
//      ],
//      end: Alignment.centerRight,
//    );
//    var draw = LinearGradient(
//      colors: [Colors.grey, Colors.white, Colors.grey],
//      begin: Alignment.centerLeft,
//      stops: [
//        0.49,
//        0.50,
//        0.51
//      ],
//      end: Alignment.centerRight,
//    );
//    var notyet = LinearGradient(
//      colors: [Colors.black, Colors.white, Colors.black],
//      begin: Alignment.centerLeft,
//      stops: [
//        0.49,
//        0.50,
//        0.51
//      ],
//      end: Alignment.centerRight,
//    );
//
//    Gradient gradient = nextMatch.forecastMatch == 'WIN'
//        ? win
//        : nextMatch.forecastMatch == 'DRAW'
//            ? draw
//        : nextMatch.forecastMatch == 'LOSE' ? lose: notyet;
//    Color color = nextMatch.forecastMatch == 'WIN'
//        ? Colors.green
//        : nextMatch.forecastMatch == 'DRAW'
//            ? Colors.yellow
//            : nextMatch.forecastMatch == 'LOSE' ? Colors.red : Colors.black;
//    final String formatted =
//        DateFormat.yMMMMEEEEd().format(DateTime.parse(nextMatch.date));
//    return FlatButton(
//
//        child: Container(
//      padding: EdgeInsets.all(10),
//          decoration: BoxDecoration(
//              border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
////              boxShadow: [
////                BoxShadow(color: Colors.grey, spreadRadius: 1)
////              ]
//          ),
//      child: Column(
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.only(bottom: 5),
//            width : MediaQuery.of(context).size.width,
//
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Text(
//                    'Day ' + nextMatch.stage.toString(),
//                    style: TextStyle(fontSize: 15, color: Colors.black),
//                  ),
//                ),
//                Align(
//                  alignment: Alignment.centerRight,
//                  child: Text(
//                    formatted,
//                    style: TextStyle(color: Colors.black),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.all(5),
//            width : MediaQuery.of(context).size.width,
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.all(Radius.circular(15)),
//                border: Border.all(color: Colors.white, width: 1),
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.white,
//                    blurRadius: 6,
//                  )
//                ],
//                gradient: gradient
//            ),
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: Center(
//                    child: Text(
//                      nextMatch.homeTeam,
//                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
//                    ),
//                  ),
//                ),
//                Expanded(
//                  flex: 1,
//                  child: Center(
//                    child: Text(
//                      nextMatch.awayTeam,
//                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    ));
//  }
//}
