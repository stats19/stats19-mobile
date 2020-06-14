import 'package:flutter/cupertino.dart';

import '../../domain/entities/league.dart';

class LeagueModel extends League {
  LeagueModel({
    @required leagueId, 
    @required name, 
    @required country, 
    @required matches, 
    @required teams
  }): super(leagueId: leagueId, name: name, country: country, matches: matches, teams: teams);

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    return LeagueModel(
      leagueId: json['leagueId'], 
      name: json['name'], 
      country: json['country'], 
      matches: json['matches'], 
      teams: json['teams']
    );
  }

}

class LeagueListModel {
  final List<LeagueModel> leagues;

  LeagueListModel({@required this.leagues});

  factory LeagueListModel.fromJson(List<dynamic> parsedJson) {
      List<LeagueModel> leagues = new List<LeagueModel>();
    leagues = parsedJson.map((i)=>LeagueModel.fromJson(i)).toList();


    return new LeagueListModel(
      leagues: leagues,
    );
  }
}
