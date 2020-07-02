import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SoccerMatch extends Equatable {
  final int matchId;
  final MatchLeague league;
  final TeamMatch homeTeam;
  final TeamMatch awayTeam;
  final List<MatchDetails> details;

  SoccerMatch(
      {@required this.matchId,
      @required this.homeTeam,
      @required this.awayTeam,
      @required this.league,
      @required this.details});

  @override
  List<Object> get props => [matchId, homeTeam, awayTeam, details, league];

  @override
  bool get stringify => true;
}

class MatchLeague extends Equatable {
  final int leagueId;
  final String name;

  MatchLeague({@required this.leagueId, @required this.name});

  @override
  List<Object> get props => [leagueId, name];
}

class TeamMatch extends Equatable {
  final int teamId;
  final String name;
  final String picture;
  final int goals;
  final int possession;
  final int shotOnTarget;
  final int fouls;
  final int yellowCard;
  final int redCard;

  TeamMatch(
      {@required this.teamId,
      @required this.name,
      @required this.picture,
      @required this.goals,
      @required this.possession,
      @required this.shotOnTarget,
      @required this.fouls,
      @required this.yellowCard,
      @required this.redCard});

  @override
  List<Object> get props => [
        teamId,
        name,
        goals,
        possession,
        shotOnTarget,
        fouls,
        yellowCard,
        redCard
      ];
}

class MatchDetails extends Equatable {
  final int playerId;
  final String playerName;
  final int elapsed;
  final int elapsedPlus;
  final bool home;
  final int type;

  MatchDetails(
      {@required this.playerId,
      @required this.playerName,
      @required this.elapsed,
      @required this.elapsedPlus,
      @required this.home,
      @required this.type});

  @override
  List<Object> get props =>
      [playerId, playerName, elapsed, elapsedPlus, type, home];
}
