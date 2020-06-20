import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/bottom_bar.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/info_square.dart';
import 'package:stat19_app_mobile/features/team/presentation/bloc/team_bloc.dart';
import 'package:stat19_app_mobile/features/team/presentation/widgets/title_team.dart';
import 'package:stat19_app_mobile/features/team/presentation/widgets/widgets.dart';

import '../../../../injection_container.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }
//  Widget build(BuildContext context) {
//    return MaterialApp(home: buildApp(context));
//  }

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
          bottomNavigationBar: BottomBar(),
    ),
    );
  }

//  BlocProvider<TeamBloc> buildApp(BuildContext context) {
//    return BlocProvider(
//      create: (_) => sl<TeamBloc>(),
//      child: TeamWidget(teamId: teamId),
//    );
//  }
}

class TeamWidget extends StatelessWidget {
  final int teamId;
  const TeamWidget({
    Key key, this.teamId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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