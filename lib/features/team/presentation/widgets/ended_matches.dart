import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/match/presentation/pages/soccer_match_page.dart';
import 'package:stat19_app_mobile/features/team/domain/entities/team.dart';
import 'package:stat19_app_mobile/features/team/presentation/bloc/team_bloc.dart';

class EndedMatches extends StatelessWidget {
  const EndedMatches({
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
              children: state.team.playedMatches.map((e) => EndedMatch(playedMatch: e)).toList()
            )
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
    //TODO afficher score
    Color color = playedMatch.result == 'WIN'
        ? Colors.green
        : playedMatch.result == 'DRAW'
        ? Colors.yellow
        : playedMatch.result == 'LOSE' ? Colors.red : Colors.black;
    return FlatButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return SoccerMatchPage(
              matchId: playedMatch.matchId,
            );
          }));
        },
        child: Text(
          playedMatch.home.name + ' - ' + playedMatch.away.name,
          style: TextStyle(fontSize: 18, color: color),
        ));
  }
}
