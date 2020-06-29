import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../bloc/soccer_match_bloc.dart';
import 'match_stat.dart';

class SoccerMatchStats extends StatelessWidget {
  const SoccerMatchStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
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
                        title: 'possession'.tr(),
                        home: state.soccerMatch.homeTeam.possession,
                        away: state.soccerMatch.awayTeam.possession),
                    MatchStat(
                        title: 'on_target'.tr(),
                        home: state.soccerMatch.homeTeam.shotOnTarget,
                        away: state.soccerMatch.awayTeam.shotOnTarget),
                    MatchStat(
                        title: 'fouls'.tr(),
                        home: state.soccerMatch.homeTeam.fouls,
                        away: state.soccerMatch.awayTeam.fouls),
                    MatchStat(
                        title: 'yellow_card'.tr(),
                        home: state.soccerMatch.homeTeam.yellowCard,
                        away: state.soccerMatch.awayTeam.yellowCard),
                    MatchStat(
                        title: 'red_card'.tr(),
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
