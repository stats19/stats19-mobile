import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/on_push_value.dart';
import '../../../../injection_container.dart';
import '../bloc/team_bloc.dart';
import '../widgets/title_team.dart';
import '../widgets/widgets.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  final int teamId;
  final ValueChanged<OnPushValue> onPush;
  TeamPage({this.teamId, this.onPush});


  BlocProvider<TeamBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TeamBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: TitleTeam(teamId: teamId)
        ),
        backgroundColor: Colors.grey[300],
        body: TeamWidget(teamId: teamId)
    ),
    );
  }
}

class TeamWidget extends StatelessWidget {
  final int teamId;
  const TeamWidget({
    Key key, this.teamId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          TeamHeader(teamId: teamId),
          RecentMatches(),
          InfoTeam(),
        ],
      ),
    );
  }
}