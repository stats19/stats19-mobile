import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/info_square.dart';
import 'package:stat19_app_mobile/features/team/presentation/bloc/team_bloc.dart';
import 'package:stat19_app_mobile/features/team/presentation/widgets/widgets.dart';

import '../../../../injection_container.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: buildApp(context));
  }

  BlocProvider<TeamBloc> buildApp(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TeamBloc>(),
      child: TeamWidget(),
    );
  }
}

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TeamHeader(),
        RecentMatches(),
        InfoTeam(),
      ],
    );
  }
}