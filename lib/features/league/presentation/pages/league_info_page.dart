import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../navigation/presentation/widgets/bottom_bar.dart';
import '../bloc/leagues_bloc.dart';
import '../widgets/widgets.dart';



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
        ),
        body: Container(
          child: Material(child: Column(
            children: <Widget>[
              Text("LEAGUE NAME"),
              InfoLeague(leagueId: leagueId)
            ],
          )),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }

}

