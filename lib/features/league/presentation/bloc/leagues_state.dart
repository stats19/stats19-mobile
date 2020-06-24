part of 'leagues_bloc.dart';

abstract class LeaguesState extends Equatable {
  List<Object> get props => [];
}

class Empty extends LeaguesState {}
class Loading extends LeaguesState {}
class LeaguesLoaded extends LeaguesState {
  final List<League> leagues;

  LeaguesLoaded({@required this.leagues});

  List<Object> get props => [leagues];
}

class MatchesByLeagueLoaded extends LeaguesState {
  final MatchesByLeague matchesByLeague;

  MatchesByLeagueLoaded({this.matchesByLeague});
  List<Object> get props => [matchesByLeague];
}

class RankingLoaded extends LeaguesState {
  final LeagueRanking ranking;

  RankingLoaded({this.ranking});
  List<Object> get props => [ranking];
}

class Error extends LeaguesState {
  final String message;

  Error({@required this.message});

  List<Object> get props => [message];
}
