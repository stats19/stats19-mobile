import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../match/presentation/pages/soccer_match_page.dart';
import '../../domain/entities/matches_by_league.dart';
import '../bloc/leagues_bloc.dart';

class ComingMatch extends StatelessWidget {
  const ComingMatch({
    Key key,
    @required this.leagueId,
  }) : super(key: key);

  final int leagueId;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                return Center(child: CircularProgressIndicator());
              } else if (state is MatchesByLeagueLoaded) {
//                print(state.matchesByLeague.toString());
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
                  matches.map((e) => ComingLeagueMatch(nextMatch: e)).toList())
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
              children: matches.map((e) => EndedMatch(playedMatch: e)).toList())
        ],
      ),
    ));
  }

  Container noMatchesFound() {
    return Container(
      child: Text(
        "Aucun match à venir",
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
          child: Text('A venir'),
        ),
        DropdownMenuItem<bool>(
          value: true,
          child: Text('Match joués'),
        )
      ],
    );
  }
}

class ComingLeagueMatch extends StatelessWidget {
  final LeagueMatch nextMatch;

  const ComingLeagueMatch({
    Key key,
    this.nextMatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO add background for potential match result
//    Color color = nextMatch.forecast == 'WIN'
//        ? Colors.green
//        : nextMatch.forecast == 'DRAW'
//        ? Colors.yellow
//        : nextMatch.forecast == 'LOSE' ? Colors.red : Colors.black;
    return FlatButton(
        child: Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(width: 0.5),
          boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 1)]),
      child: Column(
        children: <Widget>[
          Text(
            nextMatch.date,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            nextMatch.homeName + ' - ' + nextMatch.awayName,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    ));
  }
}

class EndedMatch extends StatelessWidget {
  final PlayedMatch playedMatch;

  const EndedMatch({
    Key key,
    this.playedMatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;
    return FlatButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return SoccerMatchPage(
              matchId: playedMatch.matchId,
            );
          }));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: color.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(width: 0.5),
              boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 1)]),
          child: Column(
            children: <Widget>[
              Text(playedMatch.home.goals.toString() +
                  ' - ' +
                  playedMatch.away.goals.toString()),
              Container(
                child: Text(
                  playedMatch.home.name + ' - ' + playedMatch.away.name,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}