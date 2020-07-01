import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stat19_app_mobile/features/league/domain/entities/matches_by_league.dart';

class ComingLeagueMatch extends StatelessWidget {
  final LeagueMatch nextMatch;

  const ComingLeagueMatch({
    Key key,
    this.nextMatch
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

    Gradient gradient = nextMatch.forecast == 'WIN'
        ? win
        : nextMatch.forecast == 'DRAW'
        ? draw
        : nextMatch.forecast == 'LOSE' ? lose: notyet;
    Color color = nextMatch.forecast == 'WIN'
        ? Colors.green
        : nextMatch.forecast == 'DRAW'
        ? Colors.yellow
        : nextMatch.forecast == 'LOSE' ? Colors.red : Colors.black;
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
                        child: Text(
                          nextMatch.homeName,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          nextMatch.awayName,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
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
