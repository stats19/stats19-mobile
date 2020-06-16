import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/match/presentation/bloc/soccer_match_bloc.dart';

import 'match_stat.dart';

class SoccerMatchStats extends StatelessWidget {
  const SoccerMatchStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        top: 0,
        right: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.blue),
//                                      child: Center(child: Text('action', style: TextStyle(color: Colors.white))),
      child: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            BlocBuilder<SoccerMatchBloc, SoccerMatchState>(
                builder: (context, state) {
              if (state is Loading) {
                return CircularProgressIndicator();
              } else if (state is Loaded) {
                return Column(
                  children: <Widget>[
                    MatchStat(
                        title: 'Possession',
                        home: state.soccerMatch.homeTeam.possession,
                        away: state.soccerMatch.awayTeam.possession),
                    MatchStat(
                        title: 'Tir cadrés',
                        home: state.soccerMatch.homeTeam.shotOnTarget,
                        away: state.soccerMatch.awayTeam.shotOnTarget),
                    MatchStat(
                        title: 'Fautes',
                        home: state.soccerMatch.homeTeam.fouls,
                        away: state.soccerMatch.awayTeam.fouls),
                    MatchStat(
                        title: 'Cartons jaunes',
                        home: state.soccerMatch.homeTeam.yellowCard,
                        away: state.soccerMatch.awayTeam.yellowCard),
                    MatchStat(
                        title: 'Cartons rouges',
                        home: state.soccerMatch.homeTeam.redCard,
                        away: state.soccerMatch.awayTeam.redCard)
                  ],
                );
              } else if (state is Error) {
                return Text('there is error' + state.message);
              }
              return Container();
            })
          ],
        ),
      )),
    );
  }
}
