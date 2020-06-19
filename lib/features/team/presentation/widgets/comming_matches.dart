import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/team/domain/entities/team.dart';
import 'package:stat19_app_mobile/features/team/presentation/bloc/team_bloc.dart';

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
                    .map((e) => CommingMatch(nextMatch : e))
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
    //TODO add background for match result
    return FlatButton(
        child: Text(
      nextMatch.homeTeam + ' - ' + nextMatch.awayTeam,
      style: TextStyle(fontSize: 18, color: Colors.white),
    ));
  }
}
