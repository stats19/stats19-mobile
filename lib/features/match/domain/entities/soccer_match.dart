import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SoccerMatch extends Equatable {
  final int matchId;
  final TeamMatch homeTeam;
  final TeamMatch awayTeam;
  final List<MatchDetails> details;

  SoccerMatch(
      {@required this.matchId,
      @required this.homeTeam,
      @required this.awayTeam,
      @required this.details});

  @override
  List<Object> get props => [matchId, homeTeam, awayTeam, details];

  @override
  bool get stringify => true;
}

class TeamMatch extends Equatable {
  final int teamId;
  final String name;
  final int goals;
  final int possession;
  final int shotOnTarget;
  final int fouls;
  final int yellowCard;
  final int redCard;

  TeamMatch(
      {@required this.teamId,
      @required this.name,
      @required this.goals,
      @required this.possession,
      @required this.shotOnTarget,
      @required this.fouls,
      @required this.yellowCard,
      @required this.redCard});

  @override
  List<Object> get props =>
      [teamId, name, goals, possession, shotOnTarget, fouls, yellowCard, redCard];
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
  List<Object> get props => [playerId, playerName, elapsed, elapsedPlus, type, home];
}
