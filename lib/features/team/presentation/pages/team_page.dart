import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../navigation/presentation/widgets/bottom_bar.dart';
import '../bloc/team_bloc.dart';
import '../widgets/title_team.dart';
import '../widgets/widgets.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  final int teamId;
  TeamPage({this.teamId});


  BlocProvider<TeamBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TeamBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: TitleTeam(teamId: teamId)
        ),
        backgroundColor: Colors.grey[300],
        body: TeamWidget(teamId: teamId),
          bottomNavigationBar: BottomBar(),
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