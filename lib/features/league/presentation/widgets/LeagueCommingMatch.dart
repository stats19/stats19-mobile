import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/league/presentation/bloc/leagues_bloc.dart';

class LeagueCommingMatches extends StatelessWidget {
  final int leagueId;

  const LeagueCommingMatches({
    Key key, this.leagueId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaguesBloc, LeaguesState>(builder: (context, state) {
      if ((state is Empty)) {

        BlocProvider.of<LeaguesBloc>(context)
            .add(GetMatchByLeagueEvent(leagueId));
        return Container();
      } else if (state is Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is LeaguesLoaded) {
        return Container(
          child: (ListView.builder(
//              itemBuilder: null
          )
          ),
        );
//        return Container(
//            margin: const EdgeInsets.all(10.0),
//            child: (new ListView.builder(
//              shrinkWrap: true,
//              itemCount: state.leagues == null
//                  ? 0
//                  : state.leagues.length,
//              itemBuilder: (BuildContext context, int index) {
//                return RaisedButton(
//                    child: new Text(state.leagues[index].name),
//                    splashColor: Colors.grey[900],
//                );
//              },
//            )));
      } else if (state is Error) {
        // return MessageDisplay(message: state.message);
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}
//
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
//    //TODO add background for potential match result
//    Color color = nextMatch.forecastMatch == 'WIN'
//        ? Colors.green
//        : nextMatch.forecastMatch == 'DRAW'
//        ? Colors.yellow
//        : nextMatch.forecastMatch == 'LOSE' ? Colors.red : Colors.black;
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
//              Text(nextMatch.date, style: TextStyle(color: Colors.white),),
//              Text(
//                nextMatch.homeTeam + ' - ' + nextMatch.awayTeam,
//                style: TextStyle(fontSize: 15, color: Colors.white),
//              ),
//            ],
//          ),
//        ));
//  }
//}