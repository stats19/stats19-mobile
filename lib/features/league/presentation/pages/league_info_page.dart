import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/on_push_value.dart';

import '../../../../injection_container.dart';
import '../bloc/leagues_bloc.dart';
import '../widgets/widgets.dart';



class LeagueInfoPage extends StatelessWidget {
  final int leagueId;
  final ValueChanged<OnPushValue> onPush;

  const LeagueInfoPage({Key key, this.leagueId, this.onPush}) : super(key: key);

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
        ),
        body: Container(
          child: Material(child: Column(
            children: <Widget>[
              Text("LEAGUE NAME"),
              InfoLeague(leagueId: leagueId, onPush: onPush)
            ],
          )),
        )
      ),
    );
  }

}

