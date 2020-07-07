import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/match_gradient.dart';

import '../../domain/entities/matches_by_league.dart';

class ComingLeagueMatch extends StatelessWidget {
  final LeagueMatch nextMatch;

  const ComingLeagueMatch({
    Key key,
    this.nextMatch
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var win = winLinearGradient();
    var lose = loseLinearGradient();
    var draw = drawLinearGradient();
    var notyet = notyetLinearGradient();

    final String homewin  = (nextMatch.homeName.toString() + "_HOME");
    final String awaywin  = (nextMatch.homeName.toString() + "_AWAY");

    Gradient gradient = (nextMatch.homeName + '_' + nextMatch.forecast).toString() == homewin
        ? win
        :  nextMatch.forecast == 'DRAW'
        ? draw
        : (nextMatch.homeName + '_' + nextMatch.forecast) == awaywin ? lose: notyet;

    final String formatted =
    DateFormat.yMMMMEEEEd().format(DateTime.parse(nextMatch.date));
    return FlatButton(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 5),
                width : MediaQuery.of(context).size.width,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Day ' + nextMatch.stage.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        formatted,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.network(nextMatch.homePicture, width: 25),
                            ),
                            Text(
                              nextMatch.homeName,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              nextMatch.awayName,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.network(nextMatch.awayPicture, width: 25),
                            ),
                          ],
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
