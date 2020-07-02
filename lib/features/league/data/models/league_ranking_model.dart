import 'package:meta/meta.dart';

import '../../domain/entities/league_ranking.dart';

class LeagueRankingModel extends LeagueRanking {
  LeagueRankingModel(
      {@required leagueId,
      @required leagueName,
      @required season,
      @required rankingItems})
      : super(
            leagueId: leagueId,
            leagueName: leagueName,
            rankingItems: rankingItems,
            season: season);

  factory LeagueRankingModel.fromJson(Map<String, dynamic> json) {
    return LeagueRankingModel(
        leagueId: json['leagueId'],
        leagueName: json['leagueName'],
        season: json['season'],
        rankingItems: RankingModelList.fromJson(json['rankingItems']).items);
  }
}

class RankingModel extends RankingItem {
  RankingModel(
      {@required teamId,
      @required name,
      @required matchPlayed,
      @required picture,
      @required win,
      @required draw,
      @required lose,
      @required score,
      @required points})
      : super(
            teamId: teamId,
            name: name,
            matchPlayed: matchPlayed,
            win: win,
            draw: draw,
            lose: lose,
            score: score,
            points: points, picture: picture);

  factory RankingModel.fromJson(Map<String, dynamic> json) {
    return RankingModel(
      teamId: json['teamId'],
      name: json['name'],
      matchPlayed: json['matchPlayed'],
      win: json['win'],
      draw: json['draw'],
      lose: json['lose'],
      score: json['score'],
      points: json['points'],
      picture: json['picture']
    );
  }
}

class RankingModelList {
  final List<RankingModel> items;

  RankingModelList({@required this.items});

  factory RankingModelList.fromJson(List<dynamic> parsedJson) {
    List<RankingModel> items = new List<RankingModel>();
    items = parsedJson.map((i) => RankingModel.fromJson(i)).toList();

    return new RankingModelList(
      items: items,
    );
  }
}
