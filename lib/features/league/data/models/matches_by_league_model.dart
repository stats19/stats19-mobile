import 'package:meta/meta.dart';

import '../../domain/entities/matches_by_league.dart';

class MatchesByLeagueModel extends MatchesByLeague {
  MatchesByLeagueModel({
    @required leagueId, 
    @required leagueName, 
    @required matches
  }): super(leagueId: leagueId, leagueName: leagueName, matches: matches);

  factory MatchesByLeagueModel.fromJson(Map<String, dynamic> json) {
    return MatchesByLeagueModel(
      leagueId: json['leagueId'], 
      leagueName: json['leagueName'], 
      matches: LeagueMatchModelList.fromJson(json['matches']).matches
    );
  }

}

class LeagueMatchModel extends LeagueMatch {
  LeagueMatchModel({
    @required matchId, 
    @required homeName, 
    @required awayName, 
    @required date
  }): super(matchId: matchId, homeName: homeName, awayName: awayName, date: date);

  factory LeagueMatchModel.fromJson(Map<String, dynamic> json) {
    return LeagueMatchModel(
      matchId: json['matchId'], 
      homeName: json['homeName'],
      awayName: json['awayName'],
      date: json['date']
    );
  }

}

class LeagueMatchModelList {
  final List<LeagueMatchModel> matches;

  LeagueMatchModelList({@required this.matches});

  factory LeagueMatchModelList.fromJson(List<dynamic> parsedJson) {
      List<LeagueMatchModel> matches = new List<LeagueMatchModel>();
    matches = parsedJson.map((i)=>LeagueMatchModel.fromJson(i)).toList();


    return new LeagueMatchModelList(
      matches: matches,
    );
  }
}
