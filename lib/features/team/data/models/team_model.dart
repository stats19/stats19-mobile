import 'package:meta/meta.dart';

import '../../domain/entities/team.dart';

class TeamModel extends Team {
  TeamModel(
      {@required teamId,
      @required name,
      @required shortName,
      @required matchesPlayed,
      @required matchesWin,
      @required matchesDraw,
      @required matchesLose,
      @required homeWin,
      @required awayWin,
      @required goals,
      @required goalsConceded,
      @required foul,
      @required matches})
      : super(
            teamId: teamId,
            name: name,
            shortName: shortName,
            matchesPlayed: matchesPlayed,
            matchesWin: matchesWin,
            matchesDraw: matchesDraw,
            matchesLose: matchesLose,
            homeWin: homeWin,
            awayWin: awayWin,
            goals: goals,
            goalsConceded: goalsConceded,
            foul: foul,
            matches: matches);

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
        teamId: json['teamId'],
        name: json['name'],
        shortName: json['shortName'],
        matchesPlayed: json['matchesPlayed'],
        matchesWin: json['matchesWin'],
        matchesDraw: json['matchesDraw'],
        matchesLose: json['matchesLose'],
        homeWin: json['homeWin'],
        awayWin: json['awayWin'],
        goals: json['goals'],
        goalsConceded: json['goalsConceded'],
        foul: json['foul'],
        matches: json['matches']);
  }
}
