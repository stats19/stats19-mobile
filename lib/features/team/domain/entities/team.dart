import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Team extends Equatable {
  final int teamId;
  final String name;
  final String shortName;
  final int matchesPlayed;
  final int matchesWin;
  final int matchesDraw;
  final int matchesLose;
  final int homeWin;
  final int awayWin;
  final int goals;
  final int goalsConceded;
  final int foul;
  final String matches;

  Team(
      {@required this.name,
      @required this.shortName,
      @required this.matchesPlayed,
      @required this.matchesWin,
      @required this.matchesDraw,
      @required this.matchesLose,
      @required this.homeWin,
      @required this.awayWin,
      @required this.goals,
      @required this.goalsConceded,
      @required this.foul,
      @required this.matches,
      this.teamId});

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
        foul,
        matches
      ];

  @override
  bool get stringify => true;
}
