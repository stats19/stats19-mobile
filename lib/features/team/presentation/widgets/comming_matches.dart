import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/team/presentation/bloc/team_bloc.dart';

class CommingMatches extends StatelessWidget {
  const CommingMatches({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(
        builder: (context, state) {
          if (state is Loading) {
            return CircularProgressIndicator();
          } else if (state is Loaded) {
            return Container(
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CommingMatch(
//                            home : state.team.,
//                            away : state.team.
                        ),
                      ],
                    )
                  ],
                )
            );
          } else if (state is Error) {
            return Text('there is error' + state.message);
          }
          return Container();
        });
  }
}

class CommingMatch extends StatelessWidget {
  final String home;
  final String away;
  const CommingMatch({
    Key key, this.home, this.away,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(child: Text(home + ' - ' + away, style: TextStyle(fontSize: 18, color: Colors.white), ));
  }
}
