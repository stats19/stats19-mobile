import 'package:meta/meta.dart';

import '../../domain/entities/matches_by_league.dart';

class MatchesByLeagueModel extends MatchesByLeague {
  MatchesByLeagueModel({
    @required matchId, 
    @required homeName, 
    @required awayName, 
    @required home, 
    @required away,
    @required date
  }): super(matchId: matchId, homeName: homeName, awayName: awayName, home: home, away: away, date: date);

  factory MatchesByLeagueModel.fromJson(Map<String, dynamic> json) {
    return MatchesByLeagueModel(
      matchId: json['matchId'], 
      homeName: json['homeName'], 
      home: json['home'], 
      awayName: json['awayName'], 
      away: json['away'],
      date: json['date']
    );
  }

}

class MatchesByLeagueListModel {
  final List<MatchesByLeagueModel> matchesByLeague;

  MatchesByLeagueListModel({@required this.matchesByLeague});

  factory MatchesByLeagueListModel.fromJson(List<dynamic> parsedJson) {
      List<MatchesByLeagueModel> leagues = new List<MatchesByLeagueModel>();
    leagues = parsedJson.map((i)=>MatchesByLeagueModel.fromJson(i)).toList();


    return new MatchesByLeagueListModel(
      matchesByLeague: leagues,
    );
  }
}
