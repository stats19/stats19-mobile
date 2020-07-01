import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/team_bloc.dart';

class TitleTeam extends StatelessWidget {
  const TitleTeam({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(builder: (context, state) {
      if (state is Loaded) {
        return Text(state.team.name);
      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}