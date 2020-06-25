import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/league/presentation/bloc/leagues_bloc.dart';
import 'package:stat19_app_mobile/features/league/presentation/widgets/title_league.dart';

import '../../../../injection_container.dart';

class LeagueInfoPage extends StatelessWidget {
  const LeagueInfoPage({Key key, this.leagueId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleLeague(leagueId: leagueId,)
      ),
      body: buildBody(context),
    );
  }
  final int leagueId;


  BlocProvider<LeaguesBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LeaguesBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
//          child: Container(
//              alignment: Alignment.topCenter,
//              child: BlocBuilder<LeaguesBloc, LeaguesState>(
//                  builder: (context, state) {
//                    if ((state is Empty)) {
//                      BlocProvider.of<LeaguesBloc>(context)
//                          .add(GetMatchByLeagueEvent(leagueId));
//                      print(state.props);
//                      return Container();
//                    } else if (state is Loading) {
//                      print('loading');
////                      return Center(child: CircularProgressIndicator());
//                    } else if (state is MatchesByLeagueLoaded) {
//                      print(state);
////                      return Container(
////                          margin: const EdgeInsets.all(10.0),
////                          child: Text('data')
////                      );
//                    } else if (state is Error) {
//                      print(state.message);
//                      // return MessageDisplay(message: state.message);
//                      return Text('there is error' + state.message);
//                    }
//                    return Container();
//                  })),
        ),
      ),
    );
  }
}