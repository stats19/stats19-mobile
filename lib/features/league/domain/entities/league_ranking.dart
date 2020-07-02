import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LeagueRanking extends Equatable {
  final int leagueId;
  final String leagueName;
  final String season;
  final List<RankingItem> rankingItems;

  LeagueRanking({
    @required this.leagueId, 
    @required this.leagueName,
    @required this.season,
    @required this.rankingItems
  });

  @override
  List<Object> get props => [leagueId, leagueName, season, rankingItems];

  @override
  bool get stringify => true;
}

class RankingItem extends Equatable {
  final int teamId;
  final String name;
  final String picture;
  final int matchPlayed;
  final int win;
  final int draw;
  final int lose;
  final int score;
  final int points;

   RankingItem({
    @required this.teamId, 
    @required this.name, 
    @required this.matchPlayed, 
    @required this.win,
    @required this.draw,
    @required this.lose,
    @required this.score,
    @required this.picture,
    @required this.points,
  });
  @override
  List<Object> get props => [teamId, name, matchPlayed, win, draw, lose, score, points];

}