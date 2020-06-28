import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Fantasy extends Equatable {
  final String date;
  final List<FantasyPlayer> goalKeepers;
  final List<FantasyPlayer> defenders;
  final List<FantasyPlayer> middleFielders;
  final List<FantasyPlayer> forwards;

  Fantasy(
      {@required this.date,
      @required this.goalKeepers,
      @required this.defenders,
      @required this.middleFielders,
      @required this.forwards});

  @override
  List<Object> get props => [date, goalKeepers, defenders, middleFielders, forwards];
}

class FantasyPlayer extends Equatable {
  final int playerId;
  final String name;
  final String leagueName;
  final int leagueId;
  final double score;
  final String teamName;
  final int teamId;

  FantasyPlayer(
      {@required this.playerId,
      @required this.name,
      @required this.leagueName,
      @required this.leagueId,
      @required this.score,
      @required this.teamName,
      @required this.teamId});

  @override
  List<Object> get props =>
      [playerId, name, leagueName, leagueId, score, teamName, teamId];
}
