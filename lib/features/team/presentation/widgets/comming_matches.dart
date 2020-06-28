import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/team.dart';
import '../bloc/team_bloc.dart';

class CommingMatches extends StatelessWidget {
  const CommingMatches({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(builder: (context, state) {
      if (state is Loading) {
        return CircularProgressIndicator();
      } else if (state is Loaded) {
        return Container(
            child: ListView(
          shrinkWrap: true,
          primary: false,
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
    Color color = nextMatch.forecastMatch == 'WIN'
        ? Colors.green
        : nextMatch.forecastMatch == 'DRAW'
            ? Colors.yellow
            : nextMatch.forecastMatch == 'LOSE' ? Colors.red : Colors.black;
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
              Text(nextMatch.date, style: TextStyle(color: Colors.white),),
              Text(
      nextMatch.homeTeam + ' - ' + nextMatch.awayTeam,
      style: TextStyle(fontSize: 15, color: Colors.white),
    ),
            ],
          ),
        ));
  }
}
