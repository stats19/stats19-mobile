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
        title: Text("toto")
//        title: TitleLeague(leagueId: leagueId,)
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
          child: Container(
              alignment: Alignment.topCenter,
              child: BlocBuilder<LeaguesBloc, LeaguesState>(
                  builder: (context, state) {
                    if ((state is Empty)) {
                      BlocProvider.of<LeaguesBloc>(context)
                          .add(GetMatchByLeagueEvent(leagueId));
                      return Container();
                    } else if (state is Loading) {
                        return Center(child: CircularProgressIndicator());
                    } else if (state is MatchesByLeagueLoaded) {
                        print(state.matchesByLeague.toString());
                        if(state.matchesByLeague is Empty){
                          return Container(
                            color: Colors.black,
                            height: 100,
                            width: 200,
                            child: Text("pas de match à venir", style: TextStyle(color: Colors.red),),
                          );
                        }
                        else{
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Text(state.matchesByLeague.toString())
//                            child: Text("putin de sa race")
                        );
                        }
//
                    } else if (state is Error) {
                      // return MessageDisplay(message: state.message);
                      return Text('there is error' + state.message);
                    }
                    return Container();
                  })),
        ),
      ),
    );
  }
}