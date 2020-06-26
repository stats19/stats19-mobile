import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/league/domain/entities/matches_by_league.dart';
import 'package:stat19_app_mobile/features/league/presentation/bloc/leagues_bloc.dart';



class FuturMatch extends StatelessWidget {
  const FuturMatch({
    Key key,
    @required this.leagueId,
  }) : super(key: key);

  final int leagueId;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: BlocBuilder<LeaguesBloc, LeaguesState>(
            builder: (context, state) {
              if ((state is Empty)) {
                BlocProvider.of<LeaguesBloc>(context)
                    .add(GetMatchByLeagueEvent(leagueId));
                return Container();
              } else if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MatchesByLeagueLoaded) {
                print(state.matchesByLeague.toString());
                if (state.matchesByLeague.matches.length == 0) {
                  return Container(
                    child: Text("Aucun match à venir",
                      style: TextStyle(color: Colors.red),),
                  );
                }
                else {
                  return Container(
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: <Widget>[
                          Column(
                              children: state.matchesByLeague.matches
                                  .map((e) =>
                                  CommingLeagueMatch(nextMatch: e))
                                  .toList())
                        ],
                      ));
                }
//
              } else if (state is Error) {
                return Text('there is error' + state.message);
              }
              return Container();
            }));
  }
}

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

//class CommingLeagueMatch extends StatelessWidget {
//  final LeagueMatch nextMatch;
//
//  const CommingLeagueMatch({
//    Key key,
//    this.nextMatch,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    //TODO add background for potential match result
////    Color color = nextMatch.forecastMatch == 'WIN'
////        ? Colors.green
////        : nextMatch.forecastMatch == 'DRAW'
////        ? Colors.yellow
////        : nextMatch.forecastMatch == 'LOSE' ? Colors.red : Colors.black;
//    return FlatButton(
//        child: Container(
//          width: MediaQuery.of(context).size.width * 0.8,
//          decoration: BoxDecoration(
//              color: Colors.grey.withOpacity(0.5),
//              borderRadius: BorderRadius.all(Radius.circular(15)),
//              border: Border.all(width: 0.5),
//              boxShadow: [
//                BoxShadow(color: Colors.grey, spreadRadius: 1)
//              ]
//          ),
//          child: Column(
//            children: <Widget>[
//              Text(nextMatch.date, style: TextStyle(color: Colors.white),),
//              Text(
//                nextMatch.homeName + ' - ' + nextMatch.awayName,
//                style: TextStyle(fontSize: 15, color: Colors.white),
//              ),
//            ],
//          ),
//        ));
//  }
//}