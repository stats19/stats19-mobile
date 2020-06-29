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

        body: TeamWidget(teamId: teamId),
//          backgroundColor: Colors.grey[300],

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
    return Material(
      color: Colors.grey[300],
      child: Column(
        children: <Widget>[
          TeamHeader(teamId: teamId),
          RecentMatches(),
          InfoTeam(),
        ],
      ),
    );
  }
}