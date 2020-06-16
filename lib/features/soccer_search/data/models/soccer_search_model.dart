import 'package:meta/meta.dart';

import '../../domain/entities/soccer_search.dart';

class SoccerSearchModel extends SoccerSearch {
  SoccerSearchModel(
      {@required teams,
      @required players})
      : super(teams: teams, players: players);

  factory SoccerSearchModel.fromJson(Map<String, dynamic> json) {
    return SoccerSearchModel(
        teams: MatchSearchResultModelList.fromJson(json['teams']).results,
        players: MatchSearchResultModelList.fromJson(json['players']).results);
  }
}

class MatchSearchResultModel extends SoccerSearchResult {
  MatchSearchResultModel(
      {@required id,
      @required name})
      : super(id: id, name: name);

  factory MatchSearchResultModel.fromJson(Map<String, dynamic> json) {
    return MatchSearchResultModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class MatchSearchResultModelList {
  final List<MatchSearchResultModel> results;

  MatchSearchResultModelList({@required this.results});

  factory MatchSearchResultModelList.fromJson(List<dynamic> parsedJson) {
    List<MatchSearchResultModel> results = new List<MatchSearchResultModel>();
    results = parsedJson.map((i) => MatchSearchResultModel.fromJson(i)).toList();

    return new MatchSearchResultModelList(
      results: results,
    );
  }
}