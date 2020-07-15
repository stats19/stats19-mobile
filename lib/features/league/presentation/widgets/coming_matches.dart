import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';

import '../../../../core/presentation/widgets/navigation.dart';
import '../../../../core/presentation/widgets/on_push_value.dart';
import '../../domain/entities/matches_by_league.dart';
import '../bloc/leagues_bloc.dart';
import 'widgets.dart';

class ComingMatch extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;
  const ComingMatch({
    Key key,
    @required this.leagueId, this.onPush,
  }) : super(key: key);

  final int leagueId;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white30,
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            BlocBuilder<LeaguesBloc, LeaguesState>(builder: (context, state) {
              if (state is MatchesByLeagueLoaded) {
                return MatchLeagueFilter(
                    played: state.played,
                    leagueId: state.matchesByLeague.leagueId);
              }
              return MatchLeagueFilter(played: false, leagueId: leagueId,);
            }),
            BlocBuilder<LeaguesBloc, LeaguesState>(builder: (context, state) {
              if ((state is Empty)) {
                BlocProvider.of<LeaguesBloc>(context)
                    .add(GetMatchByLeagueEvent(leagueId: leagueId));
                return Container();
              } else if (state is Loading) {
                return LoadingWidget();
              } else if (state is MatchesByLeagueLoaded) {
                if (state.matchesByLeague.matches.length == 0 &&
                    state.matchesByLeague.playedMatches.length == 0) {
                  return noMatchesFound();
                } else if (state.matchesByLeague.matches.length > 0) {
                  return comingMatchList(state.matchesByLeague.matches);
                } else if (state.matchesByLeague.playedMatches.length > 0) {
                  return endedMatchList(state.matchesByLeague.playedMatches);
                }
              } else if (state is Error) {
                return Text('there is error' + state.message);
              }
              return Container();
            }),
          ],
        ));
  }

  Container comingMatchList(List<LeagueMatch> matches) {
    return Container(
        child: Expanded(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Column(
              children:
                  matches.map((e) => ComingLeagueMatch(nextMatch: e)).toList()
          )
        ],
      ),
    ));
  }

  Container endedMatchList(List<PlayedMatch> matches) {
    return Container(
        child: Expanded(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Column(
              children: matches.map((e) => EndedMatch(playedMatch: e, onPush: onPush)).toList())
        ],
      ),
    ));
  }

  Container noMatchesFound() {
    return Container(
      child: Text(
        "no_coming_matches".tr(),
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}

class MatchLeagueFilter extends StatelessWidget {
  final bool played;
  final int leagueId;

  const MatchLeagueFilter({Key key, this.played, this.leagueId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<bool>(
      value: played,
      elevation: 16,
      onChanged: (bool newValue) {
        BlocProvider.of<LeaguesBloc>(context)
            .add(GetMatchByLeagueEvent(leagueId: leagueId, played: newValue));
      },
      items: <DropdownMenuItem<bool>>[
        DropdownMenuItem<bool>(
          value: false,
          child: Text('coming_matches').tr(),
        ),
        DropdownMenuItem<bool>(
          value: true,
          child: Text('played_matches').tr(),
        )
      ],
    );
  }
}
