import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';

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
      child: BlocBuilder<TeamBloc, TeamState>(builder: (context, state) {
        if (state is Empty) {
          BlocProvider.of<TeamBloc>(context).add(GetTeamEvent(teamId: teamId));
          return Container();
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is Loaded) {
          return Scaffold(
              appBar: AppBar(title: TitleTeam()),
              backgroundColor: Colors.grey[300],
              body: TeamWidget(teamId: teamId, onPush: onPush));
        }

        return Container();
      }),
    );
  }
}

class TeamWidget extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;
  final int teamId;

  const TeamWidget({
    Key key,
    this.teamId, this.onPush,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TeamHeader(teamId: teamId),
        RecentMatches(),
        InfoTeam(onPush: onPush),
      ],
    );
  }
}
