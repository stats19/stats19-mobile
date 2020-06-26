import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/league/presentation/bloc/leagues_bloc.dart';
import 'package:stat19_app_mobile/features/league/presentation/widgets/widgets.dart';
import 'package:stat19_app_mobile/features/navigation/presentation/widgets/bottom_bar.dart';

import '../../../../injection_container.dart';

class LeagueInfoPage extends StatelessWidget {
  final int leagueId;

  const LeagueInfoPage({Key key, this.leagueId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<LeaguesBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LeaguesBloc>(),
      child: Scaffold(
        appBar: AppBar(
            title: Text("toto")
//            title: TitleTeam(teamId: teamId)
        ),
//        body: TeamWidget(teamId: teamId),
        body: Container(
          child: Material(child: Column(
            children: <Widget>[
              Text("LEAGUE NAME"),
              InfoLeague(leagueId: leagueId)
//              FuturMatch(leagueId: leagueId),
            ],
          )),
        ),

        bottomNavigationBar: BottomBar(),
      ),
    );
  }

}

