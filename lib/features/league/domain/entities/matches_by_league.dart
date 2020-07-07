import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MatchesByLeague extends Equatable {
  final int leagueId;
  final String leagueName;
  final List<LeagueMatch> matches;
  final List<PlayedMatch> playedMatches;

  MatchesByLeague({
    @required this.leagueId, 
    @required this.leagueName, 
    @required this.matches,
    @required this.playedMatches
  });

  @override
  List<Object> get props => [leagueId, leagueName, matches, playedMatches];

  @override
  bool get stringify => true;
}

class PlayedMatch extends Equatable {
  final int matchId;
  final String date;
  final String forecast;
  final PlayedMatchTeam home;
  final PlayedMatchTeam away;

  PlayedMatch(
      {@required this.matchId,
        @required this.date,
        @required this.home,
        @required this.forecast,
        @required this.away});

  @override
  List<Object> get props => [matchId, date, home, away];
}

class PlayedMatchTeam extends Equatable {
  final int teamId;
  final String name;
  final int goals;
  final String picture;

  PlayedMatchTeam(
      {@required this.teamId, @required this.name, @required this.goals, @required this.picture});

  @override
  List<Object> get props => [teamId, name, goals];
}

class LeagueMatch extends Equatable {
  final int matchId;
  final String homeName;
  final String awayName;
  final String date;
  final String forecast;
  final int stage;
  final String homePicture;
  final String awayPicture;

   LeagueMatch({
    @required this.matchId, 
    @required this.homeName, 
    @required this.awayName, 
    @required this.date,
    @required this.forecast,
    @required this.stage,
    @required this.homePicture,
    @required this.awayPicture,
  });
  @override
  List<Object> get props => [matchId, homeName, awayName, date, forecast, stage];

}