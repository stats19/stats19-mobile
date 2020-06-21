import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Team extends Equatable {
  final int teamId;
  final String name;
  final String shortName;
  final TeamLeague league;
  final int matchesPlayed;
  final int matchesWin;
  final int matchesDraw;
  final int matchesLose;
  final int homeWin;
  final int awayWin;
  final int goals;
  final int goalsConceded;
  final int foul;
  final List<RecentMatch> recentMatches;
  final List<PlayedMatch> playedMatches;
  final List<NextMatch> nextMatches;

  Team(
      {@required this.name,
      @required this.shortName,
      @required this.league,
      @required this.matchesPlayed,
      @required this.matchesWin,
      @required this.matchesDraw,
      @required this.matchesLose,
      @required this.homeWin,
      @required this.awayWin,
      @required this.goals,
      @required this.goalsConceded,
      @required this.foul,
      @required this.teamId,
      @required this.recentMatches,
      @required this.playedMatches,
      @required this.nextMatches});

  @override
  List<Object> get props => [
        teamId,
        name,
        shortName,
        matchesPlayed,
        matchesWin,
        matchesDraw,
        matchesLose,
        homeWin,
        awayWin,
        goals,
        goalsConceded,
        foul
      ];

  @override
  bool get stringify => true;
}

class TeamLeague extends Equatable {
  final int leagueId;
  final String name;

  TeamLeague({@required this.leagueId, @required this.name});

  @override
  List<Object> get props => [leagueId, name];
}

class RecentMatch extends Equatable {
  final int matchId;
  final String result;

  RecentMatch({@required this.matchId, @required this.result});

  @override
  List<Object> get props => [matchId, result];
}

class PlayedMatch extends Equatable {
  final int matchId;
  final String date;
  final String result;
  final PlayedMatchTeam home;
  final PlayedMatchTeam away;

  PlayedMatch(
      {@required this.matchId,
      @required this.date,
      @required this.result,
      @required this.home,
      @required this.away});

  @override
  List<Object> get props => [matchId, date, result, home, away];
}

class PlayedMatchTeam extends Equatable {
  final int teamId;
  final String name;
  final int goals;

  PlayedMatchTeam(
      {@required this.teamId, @required this.name, @required this.goals});

  @override
  List<Object> get props => [teamId, name, goals];
}

class NextMatch extends Equatable {
  final String date;
  final int stage;
  final String homeTeam;
  final String awayTeam;
  final int homeTeamId;
  final int awayTeamId;
  final String forecastMatch;

  NextMatch(
      {@required this.date,
      @required this.stage,
      @required this.homeTeam,
      @required this.awayTeam,
      @required this.homeTeamId,
      @required this.awayTeamId,
      @required this.forecastMatch});

  @override
  List<Object> get props =>
      [date, stage, homeTeam, awayTeam, homeTeamId, awayTeamId, forecastMatch];
}
