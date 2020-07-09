import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/on_push_value.dart';
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
            title: BlocBuilder<LeaguesBloc, LeaguesState>(
                builder: (context, state) {
              if (state is MatchesByLeagueLoaded) {
                return Text(state.matchesByLeague.leagueName);
              } else if (state is RankingLoaded) {
                return Text(state.ranking.leagueName);
              }
              return Container();
            }),
          ),
          backgroundColor: Colors.grey[300],
          body: Container(
            child: Material(
                child: Column(
              children: <Widget>[
                InfoLeague(leagueId: leagueId, onPush: onPush)
              ],
            )),
          )),
    );
  }
}
