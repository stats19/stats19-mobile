import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/features/league/domain/entities/matches_by_league.dart';

class CommingLeagueMatch extends StatelessWidget {
  final LeagueMatch nextMatch;

  const CommingLeagueMatch({
    Key key,
    this.nextMatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO add background for potential match result
//    Color color = nextMatch.forecastMatch == 'WIN'
//        ? Colors.green
//        : nextMatch.forecastMatch == 'DRAW'
//        ? Colors.yellow
//        : nextMatch.forecastMatch == 'LOSE' ? Colors.red : Colors.black;
    return FlatButton(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(width: 0.5),
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1)
              ]
          ),
          child: Column(
            children: <Widget>[
              Text(nextMatch.date, style: TextStyle(color: Colors.white),),
              Text(
                nextMatch.homeName + ' - ' + nextMatch.awayName,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ));
  }
}