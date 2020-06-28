import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/team/presentation/bloc/team_bloc.dart';

class TitleTeam extends StatelessWidget {
  const TitleTeam({
    Key key,
    @required this.teamId,
  }) : super(key: key);

  final int teamId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(builder: (context, state) {
      if ((state is Empty)) {
        BlocProvider.of<TeamBloc>(context).add(GetTeamEvent(teamId: teamId));
        return Text("équipe");
        return Container();
      } else if (state is Loaded) {
        return Text(state.team.name);
      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}