import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Color color = playedMatch.result == 'WIN'
        ? Colors.green
        : playedMatch.result == 'DRAW'
        ? Colors.yellow
        : playedMatch.result == 'LOSE' ? Colors.red : Colors.black;
    return FlatButton(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: color.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(width: 0.5),
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1)
              ]
          ),
          child: Column(
            children: <Widget>[
              Text(playedMatch.date, style: TextStyle(color: Colors.white),),
              Text(
                playedMatch.home.name + ' - ' + playedMatch.away.name,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
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
