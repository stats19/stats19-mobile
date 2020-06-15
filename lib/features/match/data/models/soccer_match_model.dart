import 'package:meta/meta.dart';

import '../../domain/entities/soccer_match.dart';

class SoccerMatchModel extends SoccerMatch {
  SoccerMatchModel(
      {@required matchId,
      @required homeTeam,
      @required awayTeam,
      @required details})
      : super(
            matchId: matchId,
            homeTeam: homeTeam,
            awayTeam: awayTeam,
            details: details);

  factory SoccerMatchModel.fromJson(Map<String, dynamic> json) {
    return SoccerMatchModel(
        matchId: json['matchId'],
        homeTeam: TeamMatchModel.fromJson(json['homeTeam']),
        awayTeam: TeamMatchModel.fromJson(json['awayTeam']),
        details: MatchDetailsModelList.fromJson(json['details']).details);
  }
}

class TeamMatchModel extends TeamMatch {
  TeamMatchModel(
      {@required teamId,
      @required name,
      @required goals,
      @required possession,
      @required shotOnTarget,
      @required fouls,
      @required yellowCard,
      @required redCard})
      : super(
            teamId: teamId,
            name: name,
            goals: goals,
            possession: possession,
            shotOnTarget: shotOnTarget,
            fouls: fouls,
            yellowCard: yellowCard,
            redCard: redCard);

  factory TeamMatchModel.fromJson(Map<String, dynamic> json) {
    return TeamMatchModel(
      teamId: json['teamId'],
      name: json['name'],
      goals: json['goals'],
      possession: json['possession'],
      shotOnTarget: json['shotOnTarget'],
      fouls: json['fouls'],
      yellowCard: json['yellowCards'],
      redCard: json['redCards'],
    );
  }
}

class MatchDetailsModel extends MatchDetails {
  MatchDetailsModel(
      {@required playerId,
      @required playerName,
      @required elapsed,
      @required elapsedPlus,
      @required type})
      : super(
            playerId: playerId,
            playerName: playerName,
            elapsed: elapsed,
            elapsedPlus: elapsedPlus,
            type: type);

  factory MatchDetailsModel.fromJson(Map<String, dynamic> json) {
    return MatchDetailsModel(
      playerName: json['playerName'],
      elapsed: json['elapsed'],
      elapsedPlus: json['elapsedPlus'],
      playerId: json['playerId'],
      type: json['type'],
    );
  }
}

class MatchDetailsModelList {
  final List<MatchDetailsModel> details;

  MatchDetailsModelList({@required this.details});

  factory MatchDetailsModelList.fromJson(List<dynamic> parsedJson) {
    List<MatchDetailsModel> details = new List<MatchDetailsModel>();
    details = parsedJson.map((i) => MatchDetailsModel.fromJson(i)).toList();

    return new MatchDetailsModelList(
      details: details,
    );
  }
}